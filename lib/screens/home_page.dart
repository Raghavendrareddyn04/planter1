import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/weather_widget.dart';
import 'fertilizer_calculator_screen.dart';
import 'pests_diseases_screen.dart';
import 'cultivation_tips_screen.dart';
import 'about_screen.dart';
import 'help_screen.dart';
import 'community_screen.dart';
import 'dukaan_screen.dart';
import 'profile_screen.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pageController = PageController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take a Picture'),
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        _showImagePreview(image);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _showImagePreview(XFile image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selected Image'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  image.path,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.file(
                      File(image.path),
                      fit: BoxFit.cover,
                    );
                  },
                ),
                const SizedBox(height: 16),
                const Text('Would you like to analyze this plant?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Analyze'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Analyzing plant...')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: <Widget>[
          _buildMainPage(),
          const CommunityScreen(),
          const DukaanScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.grass),
            title: const Text('Your crops'),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Community'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.store),
            title: const Text('Dukaan'),
            activeColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('You'),
            activeColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildMainPage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Planter',
          style: TextStyle(
            color: Color.fromRGBO(143, 148, 251, 1),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: (value) {
              if (value == 'about') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              } else if (value == 'help') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return {'About', 'Help'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice.toLowerCase(),
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherWidget(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Save your crop',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 148, 251, 1),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(143, 148, 251, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StepItem(icon: Icons.camera_alt, text: 'Take a picture'),
                  Icon(Icons.arrow_forward, color: Colors.white),
                  _StepItem(icon: Icons.description, text: 'See diagnosis'),
                  Icon(Icons.arrow_forward, color: Colors.white),
                  _StepItem(icon: Icons.medical_services, text: 'Get medicine'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: _showImageSourceDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color.fromRGBO(143, 148, 251, 1),
                    ),
                  ),
                ),
                child: const Text(
                  'Take a picture',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                  ),
                ),
              ),
            ),
            _buildOptionCard(
              'Fertilizer calculator',
              Icons.calculate,
              Colors.blue[100]!,
              Colors.blue,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FertilizerCalculatorScreen(),
                ),
              ),
            ),
            _buildOptionCard(
              'Pests & diseases',
              Icons.bug_report,
              Colors.orange[100]!,
              Colors.orange,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PestsDiseasesScreen(),
                ),
              ),
            ),
            _buildOptionCard(
              'Cultivation Tips',
              Icons.tips_and_updates,
              Colors.green[100]!,
              Colors.green,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CultivationTipsScreen(),
                ),
              ),
            ),
            _buildOptionCard(
              'Results/Output',
              Icons.assessment,
              Colors.purple[100]!,
              Colors.purple,
              () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Analysis Results'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildResultItem('Soil Health', '85%', Colors.green),
                          _buildResultItem('Plant Growth', '92%', Colors.blue),
                          _buildResultItem('Disease Risk', 'Low', Colors.orange),
                          _buildResultItem('Yield Estimate', '3.5 tons/acre', Colors.purple),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultItem(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
    String title,
    IconData icon,
    Color bgColor,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, color: iconColor),
        onTap: onTap,
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _StepItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}