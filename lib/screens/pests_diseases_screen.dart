import 'package:flutter/material.dart';

class PestsDiseasesScreen extends StatefulWidget {
  const PestsDiseasesScreen({super.key});

  @override
  _PestAndDiseasesPageState createState() => _PestAndDiseasesPageState();
}

class _PestAndDiseasesPageState extends State<PestsDiseasesScreen> {
  bool _showMoreSeedling = false;
  bool _showMoreVegetative = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pests & Diseases'),
        backgroundColor: const Color(0xFFFFF3E0),
      ),
      body: Container(
        color: const Color(0xFFFFF3E0),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildStageSection('Seedling Stage', Colors.teal, [
              _buildDiseaseCard(
                'Damping-Off of Seedlings',
                '(Fungi)',
                Colors.green[50]!,
                'assets/images/damping_off.jpg',
                'A common disease affecting seedlings, causing them to rot at the base. It is often triggered by overwatering and poor air circulation.',
              ),
              _buildDiseaseCard(
                'Bacterial Black Spot of Mango',
                'Bacteria',
                Colors.green[100]!,
                'assets/images/bacterial_black_spot.jpg',
                'This disease causes black spots on mango leaves and fruit, reducing yield. It spreads rapidly in warm, wet conditions.',
              ),
              if (_showMoreSeedling) ...[
                _buildDiseaseCard(
                  'Aphids',
                  'Insect',
                  Colors.green[50]!,
                  'assets/images/aphids.jpg',
                  'Small sap-sucking insects that can cause significant damage to plants. They often cluster on new growth and can transmit viruses.',
                ),
                _buildDiseaseCard(
                  'Black Citrus Aphid',
                  'Insect',
                  Colors.green[100]!,
                  'assets/images/black_citrus_aphid.jpg',
                  'A pest that affects citrus plants, leading to sooty mold and reduced growth. Control measures include natural predators and insecticidal soap.',
                ),
              ],
            ], () {
              setState(() {
                _showMoreSeedling = !_showMoreSeedling;
              });
            }, _showMoreSeedling),
            _buildStageSection('Vegetative Stage', Colors.indigo, [
              _buildDiseaseCard(
                'Phoma Blight',
                '(Fungi)',
                Colors.blue[50]!,
                'assets/images/phoma_blight.jpg',
                'Phoma Blight is a fungal disease that causes dark lesions on leaves and stems, leading to plant wilting and reduced yield.',
              ),
              _buildDiseaseCard(
                'Pineapple Disease',
                '(Fungi)',
                Colors.blue[100]!,
                'assets/images/pineapple_disease.jpg',
                'Pineapple Disease affects the roots of plants, causing them to rot and leading to stunted growth and poor fruit quality.',
              ),
              if (_showMoreVegetative) ...[
                _buildDiseaseCard(
                  'Sooty Mold',
                  '(Fungi)',
                  Colors.blue[50]!,
                  'assets/images/sooty_mold.jpg',
                  'Sooty Mold is a black fungal growth that develops on the surface of leaves, often following insect infestations.',
                ),
                _buildDiseaseCard(
                  'Anthracnose',
                  '(Fungi)',
                  Colors.blue[100]!,
                  'assets/images/anthracnose.jpg',
                  'Anthracnose is a common fungal disease that causes dark, sunken lesions on leaves, stems, flowers, and fruits.',
                ),
              ],
            ], () {
              setState(() {
                _showMoreVegetative = !_showMoreVegetative;
              });
            }, _showMoreVegetative),
          ],
        ),
      ),
    );
  }

  Widget _buildStageSection(String stage, Color color, List<Widget> diseases,
      VoidCallback onSeeMore, bool showMore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stage,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 1, // One column
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: diseases,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onSeeMore,
          child: Text(showMore ? 'See Less' : 'See More'),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

/////------------------widget for disease card------------------/////
  Widget _buildDiseaseCard(String name, String type, Color color,
      String imagePath, String description) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              type,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
