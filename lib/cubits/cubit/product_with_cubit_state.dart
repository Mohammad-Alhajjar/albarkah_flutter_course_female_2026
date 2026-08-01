part of 'product_with_cubit_cubit.dart';

@immutable
sealed class ProductWithCubitState {}

final class ProductWithCubitInitial extends ProductWithCubitState {}

final class ProductWithCubitLoading extends ProductWithCubitState {}

final class ProductWithCubitSuccess extends ProductWithCubitState {
  final List<ProductModel> products;

  ProductWithCubitSuccess({required this.products});
}

final class ProductWithCubitFailure extends ProductWithCubitState {
  final String errorMessage;

  ProductWithCubitFailure({required this.errorMessage});
}
