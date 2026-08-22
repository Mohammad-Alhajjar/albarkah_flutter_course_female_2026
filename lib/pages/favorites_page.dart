import 'package:favorite_example/core/const/temp_data.dart';
import 'package:favorite_example/datasources/favorite_local_datasource.dart';
import 'package:favorite_example/models/products_model.dart';
import 'package:favorite_example/providers/favorite_provider.dart';
import 'package:favorite_example/repos/favorite_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(
        favoriteRepo: FavoriteRepo(
          favoriteLocalDatasource: FavoriteLocalDatasource(box: box),
        ),
      )..getFavoriteProduct(),
      child: Scaffold(
        appBar: AppBar(title: Text("Favorite Page")),
        body: ListView.builder(
          itemCount: jsonData.length,
          itemBuilder: (BuildContext context, int index) {
            List<ProductModel> products = List.generate(jsonData.length, (
              index,
            ) {
              return ProductModel.fromMap(jsonData[index]);
            });
            return Card(
              child: ListTile(
                leading: Image.network(
                  products[index].image!,
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: Icon(Icons.warning)),
                ),
                title: Text(products[index].title!),
                subtitle: Text(products[index].price.toString()),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
