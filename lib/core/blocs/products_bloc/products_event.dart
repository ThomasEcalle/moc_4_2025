part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class GetAllProducts extends ProductsEvent {}
