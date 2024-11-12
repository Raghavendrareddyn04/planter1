import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import 'contact_form_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('Help'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHelpSection(
            'getting_started_title',
            'getting_started_desc',
            [
              'create_account_',
              'add_first_plant',
              'setup_weather',
              'browse_catalog'
            ],
          ),
          _buildHelpSection(
            'weather_features_title',
            'weather_features_desc',
            [
              'current_weather_c',
              'spraying_time',
              'weather_forecast',
              'setup_alerts'
            ],
          ),
          _buildHelpSection(
            'plant_care_title',
            'plant_care_desc',
            [
              'watering_schedule',
              'fertilizer_application',
              'pest_control',
              'disease_management'
            ],
          ),
          _buildHelpSection(
            'shopping_guide_title',
            'shopping_guide_desc',
            [
              'browse_products',
              'add_to_cart_',
              'checkout_process',
              'order_tracking'
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactFormScreen(),
                ),
              );
            },
            child: const LocalizedText('contact_us'),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(
      String titleKey, String descriptionKey, List<String> itemKeys) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        title: LocalizedText(
          titleKey,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: LocalizedText(descriptionKey),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: itemKeys
                  .map((itemKey) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_right, color: Colors.blue),
                            const SizedBox(width: 8),
                            LocalizedText(itemKey),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
