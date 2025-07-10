import 'package:moc_4_2025/core/models/product.dart';
import 'package:moc_4_2025/core/repositories/products/products_data_source.dart';

class ProductsRepository {
  final ProductsDataSource productsDataSource;

  //final ProductsDataSource localDataSource;

  const ProductsRepository({
    required this.productsDataSource,
    //required this.localDataSource,
  });

  Future<List<Product>> getProducts() async {
    try {
      final products = await productsDataSource.getProducts();
      //await localDataSource.save(products);
      return products;
    } catch (error) {
      //return localDataSource.getProducts();
      throw Exception('Oups, une erreur est survenue');
    }
  }

  Future<void> addProductToCart(Product product) {
    return productsDataSource.addProductToCart(product);
  }
}
