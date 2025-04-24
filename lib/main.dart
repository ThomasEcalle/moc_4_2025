import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moc_4_2025/page_not_found/page_not_found.dart';
import 'package:moc_4_2025/products_screen/cart_screen/cart_screen.dart';
import 'package:moc_4_2025/products_screen/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2025/products_screen/products_screen.dart';

import 'core/models/product.dart';
import 'core/products_bloc/products_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: MaterialApp(
        routes: {
          '/': (context) => const ProductsScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
        onGenerateRoute: (settings) {
          Widget page = const PageNotFound();

          switch (settings.name) {
            case ProductDetailScreen.routeName:
              final arguments = settings.arguments;
              if (arguments is Product) {
                page = ProductDetailScreen(product: arguments);
              }
            default:
              break;
          }

          return MaterialPageRoute(
            builder: (context) => page,
            settings: settings,
          );
        },
      ),
    );
  }
}
