import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHelpSection(
            'Getting Started',
            'Learn how to use the basic features of the app',
            [
              'Create an account or log in',
              'Add your first plant',
              'Set up weather notifications',
              'Browse the plant catalog'
            ],
          ),
          _buildHelpSection(
            'Weather Features',
            'Understanding weather information',
            [
              'Current weather conditions',
              'Spraying time recommendations',
              'Weather forecasts',
              'Setting up alerts'
            ],
          ),
          _buildHelpSection(
            'Plant Care',
            'Tips for maintaining healthy plants',
            [
              'Watering schedules',
              'Fertilizer application',
              'Pest control',
              'Disease management'
            ],
          ),
          _buildHelpSection(
            'Shopping',
            'Guide to using the shop',
            [
              'Browsing products',
              'Adding items to cart',
              'Checkout process',
              'Order tracking'
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add contact support functionality
            },
            child: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(String title, String description, List<String> items) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_right, color: Colors.blue),
                            const SizedBox(width: 8),
                            Text(item),
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