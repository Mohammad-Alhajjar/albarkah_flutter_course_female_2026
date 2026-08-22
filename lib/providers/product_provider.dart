// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:favorite_example/models/products_model.dart';
import 'package:favorite_example/repos/product_repo.dart';

class ProductProvider extends ChangeNotifier {
  ProductRepo _productRepo;

  bool isLoading = false;
  List<ProductModel> products = [];
  String? errorMessgae;

  ProductProvider({
    required this._productRepo,
  });

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();
    List<ProductModel> result = await _productRepo.getProducts();
    products = result;
    isLoading = false;
    notifyListeners();
  }
}
