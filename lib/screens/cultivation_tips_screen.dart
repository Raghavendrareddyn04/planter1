import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart'; // Assuming this service provides localized text

class CultivationTipsScreen extends StatelessWidget {
  const CultivationTipsScreen({super.key});

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
        title: const LocalizedText('cultivation_tips'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTipCard(
            'soil_preparation_title',
            List.generate(10, (index) => 'soil_preparation_desc_line_$index'),
            'assets/images/soil.png',
          ),
          _buildTipCard(
            'watering_guide_title',
            List.generate(10, (index) => 'watering_guide_desc_line_$index'),
            'assets/images/watering.png',
          ),
          _buildTipCard(
            'fertilizer_application_title',
            List.generate(
                10, (index) => 'fertilizer_application_desc_line_$index'),
            'assets/images/fertilizer.png',
          ),
          _buildTipCard(
            'pest_control_title',
            List.generate(10, (index) => 'pest_control_desc_line_$index'),
            'assets/images/pest_control.png',
          ),
          _buildTipCard(
            'pruning_title',
            List.generate(10, (index) => 'pruning_desc_line_$index'),
            'assets/images/pruning.png',
          ),
          _buildTipCard(
            'harvesting_title',
            List.generate(10, (index) => 'harvesting_desc_line_$index'),
            'assets/images/harvesting.png',
          ),
          _buildTipCard(
            'composting_title',
            List.generate(10, (index) => 'composting_desc_line_$index'),
            'assets/images/composting.png',
          ),
          _buildTipCard(
            'mulching_title',
            List.generate(10, (index) => 'mulching_desc_line_$index'),
            'assets/images/mulching.png',
          ),
          _buildTipCard(
            'crop_rotation_title',
            List.generate(10, (index) => 'crop_rotation_desc_line_$index'),
            'assets/images/crop_rotation.png',
          ),
          _buildTipCard(
            'climate_adaptation_title',
            List.generate(10, (index) => 'climate_adaptation_desc_line_$index'),
            'assets/images/climate_adaptation.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(
      String titleKey, List<String> descriptionKeys, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                );
              },
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
