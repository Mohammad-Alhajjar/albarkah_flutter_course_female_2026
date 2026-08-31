import 'package:cart_example/blocs/cart_bloc/cart_bloc.dart';
import 'package:cart_example/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: Text("Cart page")),
          body: Center(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CartLoaded) {
                  if (state.cartItems.isEmpty) {
                    return Center(child: Text("No Products in Cart yet...."));
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) {
                            ProductModel product =
                                state.cartItems[index].product;
                            return Card(
                              child: ListTile(
                                leading: Image.network(product.image!),
                                title: Text(product.title!),
                                subtitle: Text(
                                  "${product.category} - ${product.price}",
                                ),
                                trailing: SizedBox(
                                  width: 150,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            UpdateQuantity(
                                              tempId: product.id!,
                                              newQuantity:
                                                  state
                                                      .cartItems[index]
                                                      .quatity +
                                                  1,
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.add_circle_outline),
                                      ),
                                      Text(
                                        state.cartItems[index].quatity
                                            .toString(),
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            UpdateQuantity(
                                              tempId: product.id!,
                                              newQuantity:
                                                  state
                                                      .cartItems[index]
                                                      .quatity -
                                                  1,
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.remove_circle_outline),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            RemoveFromCart(itemId: product.id!),
                                          );
                                        },
                                        icon: Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        state.totalPrice.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
