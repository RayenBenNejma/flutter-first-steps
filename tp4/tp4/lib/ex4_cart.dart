import 'package:flutter/material.dart';

class Product {
  const Product(this.name, this.price);

  final String name;
  final double price;
}

const List<Product> products = [
  Product('Thé à la menthe', 1.5),
  Product('Café express', 2.0),
  Product("Jus d'orange", 3.5),
];

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<int> _quantities = List<int>.filled(products.length, 0);

  double get _total {
    double total = 0;
    for (var i = 0; i < products.length; i++) {
      total += products[i].price * _quantities[i];
    }
    return total;
  }

  void _clear() {
    setState(() => _quantities.fillRange(0, _quantities.length, 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cafétéria ISET')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (var i = 0; i < products.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${products[i].name} — '
                        '${products[i].price.toStringAsFixed(1)} DT',
                      ),
                    ),
                    QuantityStepper(
                      quantity: _quantities[i],
                      onChanged: (value) =>
                          setState(() => _quantities[i] = value),
                    ),
                  ],
                ),
              ),
            const Divider(),
            Text(
              'Total : ${_total.toStringAsFixed(2)} DT',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            ClearCartButton(onClear: _total > 0 ? _clear : null),
          ],
        ),
      ),
    );
  }
}

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.max = 10,
  });

  final int quantity;
  final ValueChanged<int> onChanged;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.outlined(
          onPressed: quantity > 0 ? () => onChanged(quantity - 1) : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 32,
          child: Text('$quantity', textAlign: TextAlign.center),
        ),
        IconButton.filled(
          onPressed: quantity < max ? () => onChanged(quantity + 1) : null,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ClearCartButton extends StatelessWidget {
  const ClearCartButton({super.key, required this.onClear});

  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onClear,
      icon: const Icon(Icons.delete_outline),
      label: const Text('Vider le panier'),
    );
  }
}
