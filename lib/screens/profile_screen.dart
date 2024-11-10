import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import 'help_screen.dart';
import 'contact_form_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            _buildStats(),
            const SizedBox(height: 20),
            _buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          const Text(
            'ABCD',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const LocalizedText(
            'urban_farmer',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const LocalizedText('edit_profile_button'),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('posts', '0'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String labelKey, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        LocalizedText(
          labelKey,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(Icons.favorite, 'my_favorites', () {}),
        _buildMenuItem(Icons.history, 'purchase_history', () {}),
        _buildMenuItem(Icons.location_on, 'address_book', () {}),
        _buildMenuItem(Icons.contact_mail, 'contact_us', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactFormScreen()),
          );
        }),
        _buildMenuItem(Icons.help, 'help', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HelpScreen()),
          );
        }),
        _buildMenuItem(Icons.logout, 'logout_button', () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const LocalizedText('logout_confirmation_title'),
              content: const LocalizedText('logout_confirmation_message'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const LocalizedText('cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                  child: const LocalizedText('logout_button'),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String titleKey, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: LocalizedText(titleKey),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}