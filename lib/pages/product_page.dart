import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_session/models/product_model.dart';
import 'package:riverpod_session/providers/product_provider.dart';

final productProvider =
    AsyncNotifierProvider<ProductAsyncNotifierProvider, List<ProductModel>>(() {
      return ProductAsyncNotifierProvider();
    });

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productsListener = ref.watch(productProvider);

    ref.listen(productProvider, (previous, next) {
      if (previous!.isLoading && next.hasValue) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Data Fetched ... "),
            backgroundColor: Colors.green,
          ),
        );
      }
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error while fetching data ... "),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(productProvider.notifier).refreshProducts();
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(title: Text("Products Page")),
      body: productsListener.when(
        data: (products) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.network(products[index].image!),
                  title: Text(products[index].title!),
                  subtitle: Text(products[index].description!),
                  trailing: Text(products[index].price!.toString()),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text("$error"));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
