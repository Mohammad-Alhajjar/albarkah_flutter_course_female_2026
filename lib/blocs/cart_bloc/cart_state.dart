part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  CartLoaded({required this.cartItems});
}

final class CartFailure extends CartState {
  final String errorMessage;

  CartFailure({required this.errorMessage});
}
