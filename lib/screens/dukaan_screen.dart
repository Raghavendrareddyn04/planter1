import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import 'cart_screen.dart';
import '../services/language_service.dart';

class DukaanScreen extends StatelessWidget {
  final LanguageService _languageService;

  const DukaanScreen({super.key, required LanguageService languageService})
      : _languageService = languageService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('dukaan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16.0),
          _buildCategories(),
          const SizedBox(height: 16.0),
          _buildProductGrid(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: _languageService.getText('Search _Products').toString(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.eco, 'nameKey': 'seeds_category'},
      {'icon': Icons.water_drop, 'nameKey': 'fertilizers_category'},
      {'icon': Icons.pest_control, 'nameKey': 'pesticides_category'},
      {'icon': Icons.build, 'nameKey': 'tools_category'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green[100],
                  child: Icon(
                    categories[index]['icon'] as IconData,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8.0),
                LocalizedText(
                  categories[index]['nameKey'] as String,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildProductCard(context);
      },
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.image, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\Rs.500',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    child: const LocalizedText('add_to_cart'),
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
