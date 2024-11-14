import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'contact_form_screen.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageService languageService =
        LanguageService();

    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: languageService
              .getText('back')
              .toString(),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const LocalizedText('about'),
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
              child: const LocalizedText(
                'app_title',
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
              child: const LocalizedText(
                'created_by',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCreatorCard(
              'member_eswar',
              'team_leader',
              Icons.computer,
              const Duration(milliseconds: 1100),
            ),
            _buildCreatorCard(
              'member_raghavendra',
              'team_member',
              Icons.design_services,
              const Duration(milliseconds: 1200),
            ),
            _buildCreatorCard(
              'member_sujana',
              'team_member',
              Icons.eco,
              const Duration(milliseconds: 1300),
            ),
            _buildCreatorCard(
              'member_keerthi',
              'team_member',
              Icons.science,
              const Duration(milliseconds: 1400),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: const LocalizedText(
                'guide',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCreatorCard(
              'guide_name',
              'project_guide',
              Icons.school,
              const Duration(milliseconds: 1600),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              duration: const Duration(milliseconds: 1700),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactFormScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.mail),
                label: const LocalizedText('contact_us'),
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
    String nameKey,
    String roleKey,
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
          title: LocalizedText(
            nameKey,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: LocalizedText(roleKey),
        ),
      ),
    );
  }
}
