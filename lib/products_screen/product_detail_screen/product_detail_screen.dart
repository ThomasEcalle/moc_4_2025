import 'package:flutter/material.dart';
import 'package:moc_4_2025/core/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/productDetail';

  static void show(BuildContext context, Product product) async {
    await Navigator.of(context).pushNamed(routeName, arguments: product);
  }

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? ''),
      ),
      body: Column(
        children: [
          Text(
            '${product.price} \$',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAddToCart(context),
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  void _onAddToCart(BuildContext context) {

  }
}
