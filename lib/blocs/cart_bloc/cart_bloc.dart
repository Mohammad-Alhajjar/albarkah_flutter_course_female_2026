import 'package:cart_example/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_example/models/cart_item.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Box<CartItem> cartBox;
  CartBloc({required this.cartBox}) : super(CartLoading()) {
    on<LoadCartItems>((event, emit) {
      emit(CartLoaded(cartItems: cartBox.values.toList()));
    });

    on<AddToCart>((event, emit) async {
      final existingItemIndex = cartBox.values.toList().indexWhere(
        (element) => element.product.id == event.product.id,
      );
      if (existingItemIndex != -1) {
        final existingItem = cartBox.getAt(existingItemIndex);
        existingItem!.quatity += 1;
        existingItem.save();
      } else {
        await cartBox.put(
          event.product.id,
          CartItem(product: event.product, quatity: 1),
        );
      }
      emit(CartLoaded(cartItems: cartBox.values.toList()));
    });
    on<RemoveFromCart>((event, emit) async {
      await cartBox.delete(event.itemId);
      emit(CartLoaded(cartItems: cartBox.values.toList()));
    });

    on<UpdateQuantity>((event, emit) async {
      if (event.newQuantity <= 0) {
        await cartBox.delete(event.tempId);
      } else {
        final tempItem = cartBox.get(event.tempId);
        if (tempItem != null) {
          tempItem.quatity = event.newQuantity;
          tempItem.save();
        }
      }
      emit(CartLoaded(cartItems: cartBox.values.toList()));
    });
  }
}
