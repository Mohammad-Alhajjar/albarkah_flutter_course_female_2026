import 'package:cart_example/blocs/cart_bloc/cart_bloc.dart';
import 'package:cart_example/core/temp_data.dart';
import 'package:cart_example/models/cart_item.dart';
import 'package:cart_example/models/product_model.dart';
import 'package:cart_example/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
            actions: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  int count = 0;
                  if (state is CartLoaded) {
                    count = state.totalitemsCount;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Badge(
                      label: Text(count.toString()),
                      isLabelVisible: count > 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CartPage()),
                          );
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                    ),
                  );
                },
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
                      context.read<CartBloc>().add(AddToCart(product: prodcut));
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
    );
  }
}
