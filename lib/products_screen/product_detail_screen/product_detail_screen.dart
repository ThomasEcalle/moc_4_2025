import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moc_4_2025/core/models/product.dart';

import '../../core/blocs/cart_bloc/cart_bloc.dart';

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
      // floatingActionButton: BlocListener<CartBloc, CartState>(
      //   listener: (context, state) {
      //     if (state.status == CartStatus.errorAddingProduct) {
      //       _showError(context, state.error);
      //     }
      //   },
      //   child: BlocBuilder<CartBloc, CartState>(
      //     builder: (context, state) {
      //       final loading = state.status == CartStatus.addingProduct;
      //       return FloatingActionButton(
      //         onPressed: loading ? null : () => _onAddToCart(context),
      //         child: loading ? CircularProgressIndicator() : const Icon(Icons.add_shopping_cart),
      //       );
      //     },
      //   ),
      // ),
      floatingActionButton: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.status == CartStatus.errorAddingProduct) {
            _showError(context, state.error);
          }
        },
        builder: (context, state) {
          final loading = state.status == CartStatus.addingProduct;
          return FloatingActionButton(
            onPressed: loading ? null : () => _onAddToCart(context),
            child: loading ? CircularProgressIndicator() : const Icon(Icons.add_shopping_cart),
          );
        },
      ),
    );
  }

  void _onAddToCart(BuildContext context) {
    // final cartBloc = BlocProvider.of<CartBloc>(context);
    // cartBloc.add(AddProduct(product));
    context.read<CartBloc>().add(AddProduct(product));
  }

  void _showError(BuildContext context, Exception? error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Erreur: $error'),
    ));
  }
}
