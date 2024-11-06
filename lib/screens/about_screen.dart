import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                child: Icon(
                  Icons.eco,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: const Text(
                'Planter',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 148, 251, 1),
                ),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: const Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: const Text(
                'Created by',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCreatorCard(
              'M ESWAR KUMAR',
              'TEAM LEADER',
              Icons.computer,
              const Duration(milliseconds: 1100),
            ),
            _buildCreatorCard(
              'N RAGHAVENDRA REDDY',
              'TEAM MEMBER',
              Icons.design_services,
              const Duration(milliseconds: 1200),
            ),
            _buildCreatorCard(
              'SUJANA P',
              'TEAM MEMBER',
              Icons.eco,
              const Duration(milliseconds: 1300),
            ),
            _buildCreatorCard(
              'KEERTHI PRIYA',
              'TEAM MEMBER',
              Icons.science,
              const Duration(milliseconds: 1400),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: const Text(
                'Guide',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCreatorCard(
              'Mrs.S.RAJESWARI',
              'PROJECT GUIDE',
              Icons.school,
              const Duration(milliseconds: 1600),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              duration: const Duration(milliseconds: 1700),
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Contact Us'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: support@planter.com'),
                          SizedBox(height: 8),
                          Text('Phone: +1 234 567 890'),
                          SizedBox(height: 8),
                          Text('Address: 123 Green Street, Plant City'),
                        ],
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
                icon: const Icon(Icons.mail),
                label: const Text('Contact Us'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatorCard(
    String name,
    String role,
    IconData icon,
    Duration delay,
  ) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      delay: delay,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromRGBO(143, 148, 251, 0.2),
            child: Icon(
              icon,
              color: const Color.fromRGBO(143, 148, 251, 1),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(role),
        ),
      ),
    );
  }
}