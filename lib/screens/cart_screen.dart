import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [];
  double _total = 0.0;
  final LanguageService _languageService = LanguageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: _languageService.getText('back').toString(),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const LocalizedText('shopping_cart'),
      ),
      body: _cartItems.isEmpty
          ? const Center(
              child: LocalizedText('cart_empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image),
                          ),
                          title: Text(item['name']),
                          subtitle: Text('\$${item['price']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (item['quantity'] > 1) {
                                      item['quantity']--;
                                      _updateTotal();
                                    }
                                  });
                                },
                              ),
                              Text('${item['quantity']}'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    item['quantity']++;
                                    _updateTotal();
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _cartItems.removeAt(index);
                                    _updateTotal();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocalizedText(
                            'total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${_total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _navigateToCheckout();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const LocalizedText('proceed_checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _updateTotal() {
    _total = _cartItems.fold(
        0.0,
        (sum, item) =>
            sum + (item['price'] as double) * (item['quantity'] as int));
  }

  void _navigateToCheckout() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(totalAmount: _total),
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  final double totalAmount;

  const CheckoutScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _processPayment(context);
              },
              child: const LocalizedText('confirm_payment'),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(BuildContext context) {
    // Simulate payment processing
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Successful'),
        content: const Text('Thank you for your purchase!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
