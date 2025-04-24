part of 'products_bloc.dart';

enum ProductsStatus {
  initial,
  loading,
  success,
  error,
}

final class ProductsState {
  final ProductsStatus status;
  final List<Product> products;
  final Exception? error;

  ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const [],
    this.error,
  });
}
