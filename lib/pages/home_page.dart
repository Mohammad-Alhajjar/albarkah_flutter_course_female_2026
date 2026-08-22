import 'package:favorite_example/datasources/products_remote_data_source.dart';
import 'package:favorite_example/pages/favorites_page.dart';
import 'package:favorite_example/providers/product_provider.dart';
import 'package:favorite_example/repos/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(
        productRepo: ProductRepo(
          productsRemoteDataSource: ProductsRemoteDataSource(),
        ),
      )..getProducts(),
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
                      MaterialPageRoute(builder: (context) => FavoritesPage()),
                    );
                  },
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),

            body: Consumer<ProductProvider>(
              builder: (context, productProvider, _) {
                if (productProvider.isLoading) {
                  return Center(child: LinearProgressIndicator());
                } else if (productProvider.errorMessgae != null) {
                  return Center(child: Text("Error"));
                } else {
                  return ListView.builder(
                    itemCount: productProvider.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            productProvider.products[index].image!,
                            errorBuilder: (context, error, stackTrace) =>
                                Center(child: Icon(Icons.warning)),
                          ),
                          title: Text(productProvider.products[index].title!),
                          subtitle: Text(
                            productProvider.products[index].price.toString(),
                          ),
                          trailing: CircleAvatar(
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
