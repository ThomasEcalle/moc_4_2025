import 'package:dio/dio.dart';
import 'package:moc_4_2025/core/models/product.dart';
import 'package:moc_4_2025/core/repositories/products/products_data_source.dart';

class ApiProductsDataSource extends ProductsDataSource {
  @override
  Future<List<Product>> getProducts() async {
    final response = await Dio().get('https://dummyjson.com/products');

    if (response.statusCode == 200) {
      final data = response.data['products'] as List;
      return data.map((product) => Product.fromJson(product)).toList();
    }

    throw Exception('Oups, une erreur est survenue');
  }

  @override
  Future<Product> addProductToCart(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    return product;
  }
}
