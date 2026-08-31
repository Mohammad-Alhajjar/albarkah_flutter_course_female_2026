part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  double get totalPrice => cartItems.fold(0, (sum, item) {
    return sum + (item.quatity * item.product.price!);
  });

  int get totalitemsCount => cartItems.fold(0, (sum, item) {
    return sum + item.quatity;
  });

  CartLoaded({required this.cartItems});
}

final class CartFailure extends CartState {
  final String errorMessage;

  CartFailure({required this.errorMessage});
}
