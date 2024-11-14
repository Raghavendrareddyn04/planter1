import 'package:flutter/material.dart';
import 'cart_screen.dart';
import '../services/language_service.dart';
import '../widgets/localized_text.dart';

class Product {
  final String id;
  final String nameKey;
  final double price;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.nameKey,
    required this.price,
    required this.image,
    required this.category,
  });
}

class DukaanScreen extends StatefulWidget {
  const DukaanScreen({super.key});

  @override
  State<DukaanScreen> createState() => _DukaanScreenState();
}

class _DukaanScreenState extends State<DukaanScreen> {
  static final LanguageService _languageService = LanguageService();
  String _selectedCategory = 'all';

  static final List<Product> products = [
    // Seeds Category
    Product(
      id: '1',
      nameKey: 'tomato_seeds',
      price: 2.99,
      image: 'assets/images/tomato_seeds.jpg',
      category: 'seeds',
    ),
    Product(
      id: '2',
      nameKey: 'chili_seeds',
      price: 3.99,
      image: 'assets/images/chili_seeds.jpg',
      category: 'seeds',
    ),
    // Fertilizers Category
    Product(
      id: '3',
      nameKey: 'organic_fertilizer',
      price: 29.99,
      image: 'assets/images/organic_fertilizer.jpg',
      category: 'fertilizers',
    ),
    Product(
      id: '4',
      nameKey: 'npk_fertilizer',
      price: 24.99,
      image: 'assets/images/npk_fertilizer.jpg',
      category: 'fertilizers',
    ),
    // Pesticides Category
    Product(
      id: '5',
      nameKey: 'neem_oil',
      price: 19.99,
      image: 'assets/images/neem_oil.jpg',
      category: 'pesticides',
    ),
    Product(
      id: '6',
      nameKey: 'organic_pesticide',
      price: 15.99,
      image: 'assets/images/organic_pesticide.jpg',
      category: 'pesticides',
    ),
    // Tools Category
    Product(
      id: '7',
      nameKey: 'garden_tools',
      price: 49.99,
      image: 'assets/images/garden_tools.jpg',
      category: 'tools',
    ),
    Product(
      id: '8',
      nameKey: 'watering_can',
      price: 15.99,
      image: 'assets/images/watering_can.jpg',
      category: 'tools',
    ),
  ];

  List<Product> get filteredProducts {
    if (_selectedCategory == 'all') {
      return products;
    }
    return products.where((product) => product.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('dukaan'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: CartManager.instance.itemCount,
                builder: (context, count, child) {
                  if (count == 0) return const SizedBox.shrink();
                  return Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        count.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ],
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
        hintText: _languageService.getText('search_products_placeholder'),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.eco, 'nameKey': 'seeds_category', 'id': 'seeds'},
      {'icon': Icons.water_drop, 'nameKey': 'fertilizers_category', 'id': 'fertilizers'},
      {'icon': Icons.pest_control, 'nameKey': 'pesticides_category', 'id': 'pesticides'},
      {'icon': Icons.build, 'nameKey': 'tools_category', 'id': 'tools'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category['id'];
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = isSelected ? 'all' : category['id'] as String;
              });
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: 16.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[100] : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: isSelected ? Colors.green : Colors.green[100],
                    child: Icon(
                      category['icon'] as IconData,
                      color: isSelected ? Colors.white : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  LocalizedText(
                    category['nameKey'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
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
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return _buildProductCard(context, product);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image, size: 50),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocalizedText(
                  product.nameKey,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
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
                      CartManager.instance.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: LocalizedText('added_to_cart'),
                          duration: const Duration(seconds: 1),
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