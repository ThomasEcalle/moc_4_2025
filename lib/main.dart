import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moc_4_2025/core/repositories/products/api_products_data_source.dart';
import 'package:moc_4_2025/core/repositories/products/products_repository.dart';
import 'package:moc_4_2025/page_not_found/page_not_found.dart';
import 'package:moc_4_2025/products_screen/cart_screen/cart_screen.dart';
import 'package:moc_4_2025/products_screen/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2025/products_screen/products_screen.dart';

import 'core/blocs/cart_bloc/cart_bloc.dart';
import 'core/blocs/products_bloc/products_bloc.dart';
import 'core/models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductsRepository(
        productsDataSource: ApiProductsDataSource(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(
              productsRepository: context.read<ProductsRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              productsRepository: context.read<ProductsRepository>(),
            ),
          ),
        ],
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
      ),
    );
  }
}
