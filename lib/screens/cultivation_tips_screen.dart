import 'package:flutter/material.dart';

class CultivationTipsScreen extends StatelessWidget {
  const CultivationTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cultivation Tips'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTipCard(
            'Soil Preparation',
            'Learn how to prepare soil for optimal plant growth.',
            'assets/images/soil.png', // Add this image later
          ),
          _buildTipCard(
            'Watering Guide',
            'Best practices for watering different types of plants.',
            'assets/images/watering.png', // Add this image later
          ),
          // Add more tips as needed
        ],
      ),
    );
  }

  Widget _buildTipCard(String title, String description, String imagePath) {
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
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