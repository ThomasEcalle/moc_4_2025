part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {
  const CartEvent();
}

final class AddProduct extends CartEvent {
  final Product product;

  const AddProduct(this.product);
}
