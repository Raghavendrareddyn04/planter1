import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/weather_widget.dart';
import '../services/language_service.dart';
import '../widgets/localized_text.dart';
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
  final _languageService = LanguageService();

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
          title: const LocalizedText('select_image_source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const LocalizedText('take_picture_option'),
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const LocalizedText('choose_gallery'),
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
          title: const LocalizedText('selected_image'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.file(
                  File(image.path),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                const LocalizedText('analyze_plant_question'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const LocalizedText('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const LocalizedText('analyze'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: LocalizedText('analyzing_plant'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const LocalizedText('select_language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                leading: Radio<String>(
                  value: 'English',
                  groupValue: _languageService.currentLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _languageService.setLanguage(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('తెలుగు'),
                leading: Radio<String>(
                  value: 'Telugu',
                  groupValue: _languageService.currentLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _languageService.setLanguage(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
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
            title: const LocalizedText('your_crops'),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const LocalizedText('community'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.store),
            title: const LocalizedText('dukaan'),
            activeColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const LocalizedText('you'),
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
        title: const LocalizedText(
          'app_title',
          style: TextStyle(
            color: Color.fromRGBO(143, 148, 251, 1),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Tooltip(
            message: 'Change language',
            child: IconButton(
              icon: const Icon(Icons.language),
              onPressed: _showLanguageDialog,
              color: Colors.black,
            ),
          ),
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
              return {'about', 'help'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: LocalizedText(choice),
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
              child: LocalizedText(
                'save_crop',
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
                  _StepItem(icon: Icons.camera_alt, textKey: 'take_picture'),
                  Icon(Icons.arrow_forward, color: Colors.white),
                  _StepItem(icon: Icons.description, textKey: 'see_diagnosis'),
                  Icon(Icons.arrow_forward, color: Colors.white),
                  _StepItem(
                      icon: Icons.medical_services, textKey: 'get_medicine'),
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
                child: const LocalizedText(
                  'take_picture',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                  ),
                ),
              ),
            ),
            _buildOptionCard(
              'fertilizer_calculator',
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
              'pests_diseases',
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
              'cultivation_tips',
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
              'results_output',
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
                          _buildResultItem(
                              'Disease Risk', 'Low', Colors.orange),
                          _buildResultItem(
                              'Yield Estimate', '3.5 tons/acre', Colors.purple),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const LocalizedText('cancel'),
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
    String textKey,
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
        title: LocalizedText(textKey),
        trailing: Icon(Icons.arrow_forward_ios, color: iconColor),
        onTap: onTap,
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final IconData icon;
  final String textKey;

  const _StepItem({required this.icon, required this.textKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        LocalizedText(
          textKey,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
