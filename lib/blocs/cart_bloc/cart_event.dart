part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class LoadCartItems extends CartEvent {}

final class AddToCart extends CartEvent {
  final ProductModel product;

  AddToCart({required this.product});
}

final class RemoveFromCart extends CartEvent {
  final int itemId;

  RemoveFromCart({required this.itemId});
}

final class UpdateQuantity extends CartEvent {
  final int tempId;
  final int newQuantity;

  UpdateQuantity({required this.tempId, required this.newQuantity});
}
