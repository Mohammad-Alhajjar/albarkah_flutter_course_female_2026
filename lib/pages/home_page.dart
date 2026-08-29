import 'package:cart_example/blocs/cart_bloc/cart_bloc.dart';
import 'package:cart_example/core/temp_data.dart';
import 'package:cart_example/models/cart_item.dart';
import 'package:cart_example/models/product_model.dart';
import 'package:cart_example/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.cartBox});
  final Box<CartItem> cartBox;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(cartBox: cartBox)..add(LoadCartItems()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home Page"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<CartBloc>(context),
                          child: CartPage(),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: TempData.prodcuts.length,
              itemBuilder: (context, index) {
                final ProductModel prodcut = TempData.prodcuts[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(prodcut.image!),
                    title: Text(prodcut.title!),
                    subtitle: Text("${prodcut.category} - ${prodcut.price}"),
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        context.read<CartBloc>().add(
                          AddToCart(product: prodcut),
                        );
                      },
                      label: Text("Add"),
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
