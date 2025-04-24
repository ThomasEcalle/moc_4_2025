import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddProduct>(_onAddProduct);
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.addingProduct));

    await Future.delayed(const Duration(seconds: 5));
    final existingProducts = state.products;
    final productToAdd = event.product;

    emit(state.copyWith(
      status: CartStatus.errorAddingProduct,
      error: Exception('Oups, produit indisponible'),
    ));

    // emit(state.copyWith(
    //   status: CartStatus.successAddingProduct,
    //   products: [...existingProducts, productToAdd],
    // ));
  }
}
