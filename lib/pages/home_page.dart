import 'package:favorite_example/datasources/favorite_local_datasource.dart';
import 'package:favorite_example/datasources/products_remote_data_source.dart';
import 'package:favorite_example/main.dart';
import 'package:favorite_example/pages/favorites_page.dart';
import 'package:favorite_example/providers/favorite_provider.dart';
import 'package:favorite_example/providers/product_provider.dart';
import 'package:favorite_example/repos/favorite_repo.dart';
import 'package:favorite_example/repos/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(
            productRepo: ProductRepo(
              productsRemoteDataSource: ProductsRemoteDataSource(),
            ),
          )..getProducts(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(
            favoriteRepo: FavoriteRepo(
              favoriteLocalDatasource: FavoriteLocalDatasource(
                box: favoritesBox,
              ),
            ),
          )..getFavoriteProduct(),
        ),
      ],
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
                          trailing: Consumer<FavoriteProvider>(
                            builder: (context, favoriteProvider, _) {
                              return CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<FavoriteProvider>()
                                        .toggleFavorite(
                                          product:
                                              productProvider.products[index],
                                        );
                                  },
                                  icon:
                                      favoriteProvider.isProductFavorite(
                                        productProvider.products[index],
                                      )
                                      ? Icon(Icons.favorite, color: Colors.red)
                                      : Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Colors.grey,
                                        ),
                                ),
                              );
                            },
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
