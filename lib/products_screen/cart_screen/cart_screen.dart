import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocs/cart_bloc/cart_bloc.dart';
import '../../core/models/product.dart';
import '../widgets/product_list_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static void navigateTo(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final products = context.read<CartBloc>().state.products;
    final products = context.select((CartBloc cartBloc) => cartBloc.state.products);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
      ),
      body: _buildList(context, products),
    );
  }

  Widget _buildList(BuildContext context, List<Product> products) {
    if (products.isEmpty) return _buildEmptyCart(context);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductListItem(
          product: product,
        );
      },
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          const Text(
            'Votre panier est vide',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Revenir en arrière'),
          ),
        ],
      ),
    );
  }
}
