import 'package:moc_4_2025/core/models/product.dart';

abstract class ProductsDataSource {
  Future<List<Product>> getProducts();

  Future<Product> addProductToCart(Product product);
}
