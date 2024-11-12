import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart'; // Assuming this service provides localized text

class CultivationTipsScreen extends StatelessWidget {
  const CultivationTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageService languageService =
        LanguageService(); // Initialize LanguageService to get localized text

    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: languageService
              .getText('back')
              .toString(), // Localized text for "Back"
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
            'soil_preparation_desc',
            'assets/images/soil.png',
          ),
          _buildTipCard(
            'watering_guide_title',
            'watering_guide_desc',
            'assets/images/watering.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(
      String titleKey, String descriptionKey, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.image, size: 50),
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
                LocalizedText(
                  descriptionKey,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
