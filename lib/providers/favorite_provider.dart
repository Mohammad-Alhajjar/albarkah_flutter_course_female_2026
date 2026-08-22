// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:favorite_example/models/products_model.dart';
import 'package:favorite_example/repos/favorite_repo.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteRepo favoriteRepo;
  List<ProductModel> favoriteProducts = [];
  FavoriteProvider({required this.favoriteRepo});

  void getFavoriteProduct() {
    favoriteProducts = favoriteRepo.getFavoriteProdcuts();
    notifyListeners();
  }

  Future<void> togglrFavorite(ProductModel product) async {
    await favoriteRepo.toggleFavorite(product: product);
    List<dynamic> productMaps = List.generate(favoriteProducts.length, (index) {
      return favoriteProducts[index].toMap();
    });
    bool isCurrentlyFavorite = favoriteProducts.any((element) {
      return element.id == product.id;
    });
    if (isCurrentlyFavorite) {
      favoriteProducts.where((element) {
        return element.id != product.id;
      });
    } else {
      favoriteProducts = [...favoriteProducts, product];
    }
    notifyListeners();
  }

  bool isProductFavorite(ProductModel product) {
    return favoriteProducts.any((element) {
      return element.id == product.id;
    });
  }
}
