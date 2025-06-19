import 'package:moc_4_2025/core/models/product.dart';
import 'package:moc_4_2025/core/repositories/products/products_data_source.dart';

class FakeProductsDataSource extends ProductsDataSource {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }

  @override
  Future<Product> addProductToCart(Product product) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }
}
