import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moc_4_2025/core/repositories/products/products_repository.dart';

import '../../models/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc({required this.productsRepository}) : super(ProductsState()) {
    on<GetAllProducts>(_onGetAllProducts);
  }

  void _onGetAllProducts(GetAllProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsState(status: ProductsStatus.loading));

    try {
      final products = await productsRepository.getProducts();
      emit(ProductsState(
        status: ProductsStatus.success,
        products: products,
      ));
    } catch (error) {
      emit(ProductsState(
        status: ProductsStatus.error,
        error: error as Exception,
      ));
    }
  }
}
