import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import 'dukaan_screen.dart';
import 'dart:async';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartManager {
  static final CartManager instance = CartManager._internal();
  CartManager._internal();

  final Map<String, CartItem> _items = {};
  final _itemCountNotifier = ValueNotifier<int>(0);
  final _totalNotifier = ValueNotifier<double>(0.0);

  ValueNotifier<int> get itemCount => _itemCountNotifier;
  ValueNotifier<double> get total => _totalNotifier;

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    _updateNotifiers();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    _updateNotifiers();
  }

  void updateQuantity(String productId, int quantity) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity = quantity;
      _updateNotifiers();
    }
  }

  void clearCart() {
    _items.clear();
    _updateNotifiers();
  }

  List<CartItem> get items => _items.values.toList();

  void _updateNotifiers() {
    _itemCountNotifier.value = _items.values.fold(
        0, (sum, item) => sum + item.quantity);
    _totalNotifier.value = _items.values.fold(
        0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('shopping_cart'),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: CartManager.instance.itemCount,
        builder: (context, itemCount, child) {
          if (itemCount == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 64),
                  const SizedBox(height: 16),
                  const LocalizedText('cart_empty'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const LocalizedText('continue_shopping'),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: CartManager.instance.items.length,
                  itemBuilder: (context, index) {
                    final item = CartManager.instance.items[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset(
                            item.product.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image);
                            },
                          ),
                        ),
                        title: LocalizedText(item.product.nameKey),
                        subtitle: Text(
                            '₹${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (item.quantity > 1) {
                                    CartManager.instance.updateQuantity(
                                        item.product.id, item.quantity - 1);
                                  } else {
                                    CartManager.instance
                                        .removeFromCart(item.product.id);
                                  }
                                });
                              },
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  CartManager.instance.updateQuantity(
                                      item.product.id, item.quantity + 1);
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  CartManager.instance
                                      .removeFromCart(item.product.id);
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
                        ValueListenableBuilder<double>(
                          valueListenable: CartManager.instance.total,
                          builder: (context, total, child) {
                            return Text(
                              '₹${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _isProcessing
                          ? null
                          : () => _processCheckout(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: _isProcessing
                          ? const CircularProgressIndicator()
                          : const LocalizedText('proceed_to_checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _processCheckout(BuildContext context) async {
    setState(() {
      _isProcessing = true;
    });

    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isProcessing = false;
    });

    // Show success dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const LocalizedText('order_success'),
        content: const LocalizedText('order_success_message'),
        actions: [
          TextButton(
            onPressed: () {
              CartManager.instance.clearCart();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const LocalizedText('continue_shopping'),
          ),
        ],
      ),
    );
  }
}