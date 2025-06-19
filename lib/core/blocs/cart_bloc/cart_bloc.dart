import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moc_4_2025/core/repositories/products/products_repository.dart';

import '../../models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductsRepository productsRepository;

  CartBloc({required this.productsRepository}) : super(CartState()) {
    on<AddProduct>(_onAddProduct);
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.addingProduct));

    final createdProduct = await productsRepository.addProductToCart(event.product);
    final existingProducts = state.products;
    final productToAdd = event.product;

    // emit(state.copyWith(
    //   status: CartStatus.errorAddingProduct,
    //   error: Exception('Oups, produit indisponible'),
    // ));

    emit(state.copyWith(
      status: CartStatus.successAddingProduct,
      products: [...existingProducts, productToAdd],
    ));
  }
}
