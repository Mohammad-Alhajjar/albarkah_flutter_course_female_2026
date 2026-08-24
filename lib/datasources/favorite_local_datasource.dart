// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:favorite_example/models/products_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteLocalDatasource {
  Box box;
  FavoriteLocalDatasource({required this.box});
  List<ProductModel> getFavoriteProducts() {
    List<dynamic> favoriteData = box.values.toList();
    List<ProductModel> favoriteProducts = List.generate(
      favoriteData.length,
      (index) => ProductModel.fromMap(favoriteData[index]),
    );
    return favoriteProducts;
  }

  Future<void> toggleFavorite({required ProductModel product}) async {
    
    List<dynamic> favoriteData = box.values.toList();
    List<ProductModel> favoriteProducts = List.generate(
      favoriteData.length,
      (index) => ProductModel.fromMap(favoriteData[index]),
    );

    if (box.containsKey(product.id)) {
      await box.delete(product.id);
    } else {
      box.put(product.id, product.toMap());
    }
  }
}
