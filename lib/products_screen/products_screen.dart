import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moc_4_2025/core/models/product.dart';
import 'package:moc_4_2025/products_screen/cart_screen/cart_screen.dart';
import 'package:moc_4_2025/products_screen/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2025/products_screen/widgets/product_list_item.dart';

import '../core/blocs/cart_bloc/cart_bloc.dart';
import '../core/blocs/products_bloc/products_bloc.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    final productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(GetAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              print('Coucou, je build l\icône de panier');
              return IconButton(
                icon: Row(
                  children: [
                    const Icon(Icons.shopping_cart),
                    Text('${state.products.length}')
                  ],
                ),
                onPressed: () => _onCartIconTap(context),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return switch (state.status) {
            ProductsStatus.initial || ProductsStatus.loading => _buildLoading(context),
            ProductsStatus.error => _buildError(context, state.error),
            ProductsStatus.success => _buildProductsList(context, state.products),
          };
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context, Exception? error) {
    return Center(
      child: Text(
        error?.toString() ?? 'Erreur inconnue',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return const Center(
      child: Text('Aucun produit disponible'),
    );
  }

  Widget _buildProductsList(BuildContext context, List<Product> products) {
    if (products.isEmpty) return _buildEmpty(context);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductListItem(
          product: product,
          onTap: () => _onProductTap(context, product),
        );
      },
    );
  }

  void _onProductTap(BuildContext context, Product product) {
    ProductDetailScreen.show(context, product);
  }

  void _onCartIconTap(BuildContext context) {
    CartScreen.navigateTo(context);
  }
}
