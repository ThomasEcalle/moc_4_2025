import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState()) {
    on<GetAllProducts>(_onGetAllProducts);
  }

  void _onGetAllProducts(GetAllProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsState(status: ProductsStatus.loading));

    try {
      final products = await _getAllProducts();
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

  Future<List<Product>> _getAllProducts() async {
    final response = await Dio().get('https://dummyjson.com/products');
    if (response.statusCode == 200) {
      final data = response.data['products'] as List;
      return data.map((product) => Product.fromJson(product)).toList();
    }

    throw Exception('Oups, une erreur est survenue');
  }
}
