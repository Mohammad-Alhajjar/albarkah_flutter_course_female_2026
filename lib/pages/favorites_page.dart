import 'package:favorite_example/core/const/temp_data.dart';
import 'package:favorite_example/datasources/favorite_local_datasource.dart';
import 'package:favorite_example/main.dart';
import 'package:favorite_example/models/products_model.dart';
import 'package:favorite_example/providers/favorite_provider.dart';
import 'package:favorite_example/repos/favorite_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(
        favoriteRepo: FavoriteRepo(
          favoriteLocalDatasource: FavoriteLocalDatasource(box: favoritesBox),
        ),
      )..getFavoriteProduct(),
      child: Scaffold(
        appBar: AppBar(title: Text("Favorite Page")),
        body: Consumer<FavoriteProvider>(
          builder: (context, favoriteProvider, _) {
            if (favoriteProvider.favoriteProducts.isEmpty) {
              return Center(child: Text("No Favorite Products Yet ...."));
            }
            return ListView.builder(
              itemCount: favoriteProvider.favoriteProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      favoriteProvider.favoriteProducts[index].image!,
                      errorBuilder: (context, error, stackTrace) =>
                          Center(child: Icon(Icons.warning)),
                    ),
                    title: Text(
                      favoriteProvider.favoriteProducts[index].title!,
                    ),
                    subtitle: Text(
                      favoriteProvider.favoriteProducts[index].price.toString(),
                    ),
                    trailing: CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<FavoriteProvider>()
                                        .toggleFavorite(
                                          product:
                                              favoriteProvider.favoriteProducts[index],
                                        );
                                  },
                                  icon:
                                      favoriteProvider.isProductFavorite(
                                        favoriteProvider.favoriteProducts[index],
                                      )
                                      ? Icon(Icons.favorite, color: Colors.red)
                                      : Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Colors.grey,
                                        ),
                                ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
