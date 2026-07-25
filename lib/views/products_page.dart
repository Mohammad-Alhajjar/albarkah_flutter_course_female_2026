import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/models/product_model.dart';
import 'package:provider_state_management/providers/product_provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // @override
  // void initState() {
  //   context.read<ProductProvider>().getAllProducts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProductProvider()..getAllProducts();
      },
      child: Builder(
        builder: (context) {
          ProductProvider productProvider = context.watch<ProductProvider>();
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<ProductProvider>().createProduct(
                  newProduct: Product(title: "BMW 520i"),
                );
              },
              child: Icon(Icons.create),
            ),
            body: productProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : productProvider.errorMessage.isNotEmpty
                ? Center(child: Text(productProvider.errorMessage))
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Product product = productProvider.products[index];
                      return ListTile(
                        leading: Image.network(product.thumbnail!),
                        trailing: Text(product.price!.toString()),
                        title: Text(product.title!),
                        subtitle: Text(product.description!),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
