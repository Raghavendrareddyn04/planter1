import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart'; // Assuming this service provides localized text

class PestsDiseasesScreen extends StatelessWidget {
  const PestsDiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageService languageService = LanguageService();

    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: languageService.getText('back').toString(),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const LocalizedText('pests_diseases_title'),
        backgroundColor: const Color(0xFFFFF3E0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDiseaseCard(
            'damping_off',
            List.generate(10, (index) => 'damping_off_desc_line_$index'),
            'assets/images/damping_off.jpg',
          ),
          _buildDiseaseCard(
            'bacterial_black_spot',
            List.generate(
                10, (index) => 'bacterial_black_spot_desc_line_$index'),
            'assets/images/bacterial_black_spot.jpg',
          ),
          _buildDiseaseCard(
            'aphids',
            List.generate(10, (index) => 'aphids_desc_line_$index'),
            'assets/images/aphids.jpg',
          ),
          _buildDiseaseCard(
            'black_citrus_aphid',
            List.generate(10, (index) => 'black_citrus_aphid_desc_line_$index'),
            'assets/images/black_citrus_aphid.jpg',
          ),
          _buildDiseaseCard(
            'powdery_mildew',
            List.generate(10, (index) => 'powdery_mildew_desc_line_$index'),
            'assets/images/powdery_mildew.jpg',
          ),
          _buildDiseaseCard(
            'phoma_blight',
            List.generate(10, (index) => 'phoma_blight_desc_line_$index'),
            'assets/images/phoma_blight.jpg',
          ),
          _buildDiseaseCard(
            'pineapple_disease',
            List.generate(10, (index) => 'pineapple_disease_desc_line_$index'),
            'assets/images/pineapple_disease.jpg',
          ),
          _buildDiseaseCard(
            'sooty_mold',
            List.generate(10, (index) => 'sooty_mold_desc_line_$index'),
            'assets/images/sooty_mold.jpg',
          ),
          _buildDiseaseCard(
            'anthracnose',
            List.generate(10, (index) => 'anthracnose_desc_line_$index'),
            'assets/images/anthracnose.jpg',
          ),
          _buildDiseaseCard(
            'leaf_spot',
            List.generate(10, (index) => 'leaf_spot_desc_line_$index'),
            'assets/images/leaf_spot.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(
      String titleKey, List<String> descriptionKeys, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.grey[300],
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image, size: 50),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocalizedText(
                  titleKey,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...descriptionKeys.map(
                  (key) => LocalizedText(
                    key,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
