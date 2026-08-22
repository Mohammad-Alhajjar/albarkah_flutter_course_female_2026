// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:favorite_example/datasources/favorite_local_datasource.dart';
import 'package:favorite_example/models/products_model.dart';

class FavoriteRepo {
  FavoriteLocalDatasource favoriteLocalDatasource;
  FavoriteRepo({required this.favoriteLocalDatasource});

  List<ProductModel> getFavoriteProdcuts() {
    return favoriteLocalDatasource.getFavoriteProducts();
  }

  Future<void> toggleFavorite({required ProductModel product}) async {
    await favoriteLocalDatasource.toggleFavorite(product: product);

    
  }
}
