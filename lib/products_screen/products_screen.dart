import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moc_4_2025/core/models/product.dart';
import 'package:moc_4_2025/products_screen/cart_screen/cart_screen.dart';
import 'package:moc_4_2025/products_screen/product_detail_screen/product_detail_screen.dart';

import 'widgets/product_list_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Product> _products = [];
  bool _loading = true;
  Exception? _error;

  @override
  void initState() {
    super.initState();
    _getAllProducts();
  }

  void _getAllProducts() async {
    try {
      final response = await Dio().get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        final data = response.data['products'] as List;
        _products.addAll(data.map((product) => Product.fromJson(product)).toList());
      }
    } catch (error) {
      _error = error as Exception;
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => _onCartIconTap(context),
          ),
        ],
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_loading) return _buildLoading(context);
    if (_error != null) return _buildError(context);
    if (_products.isEmpty) return _buildEmpty(context);
    return _buildProductsList(context);
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context) {
    return Center(
      child: Text(
        _error?.toString() ?? 'Erreur inconnue',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return const Center(
      child: Text('Aucun produit disponible'),
    );
  }

  Widget _buildProductsList(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
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
