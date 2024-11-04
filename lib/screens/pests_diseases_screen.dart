import 'package:flutter/material.dart';

class PestsDiseasesScreen extends StatelessWidget {
  const PestsDiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pests & Diseases'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPestDiseaseCard(
            'Common Aphids',
            'Small sap-sucking insects that can cause significant damage to plants.',
            'assets/images/aphids.png', // Add this image later
          ),
          _buildPestDiseaseCard(
            'Powdery Mildew',
            'A fungal disease that appears as white powdery spots on leaves.',
            'assets/images/mildew.png', // Add this image later
          ),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildPestDiseaseCard(String title, String description, String imagePath) {
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