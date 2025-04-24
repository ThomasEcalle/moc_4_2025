part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  addingProduct,
  successAddingProduct,
  errorAddingProduct,
}

class CartState {
  final CartStatus status;
  final List<Product> products;
  final Exception? error;

  CartState({
    this.status = CartStatus.initial,
    this.products = const [],
    this.error,
  });

  CartState copyWith({
    CartStatus? status,
    List<Product>? products,
    Exception? error,
  }) {
    return CartState(
      status: status ?? this.status,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }
}
