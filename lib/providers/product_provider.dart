import 'package:flutter/material.dart';
import 'package:provider_state_management/models/product_model.dart';
import 'package:provider_state_management/services/product_service.dart';

import '../core/config/di.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  String errorMessage = "";
  bool isLoading = false;
  bool isCreated = false;

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    List<Product>? productsData = await sl.get<ProductService>().getAll();
    if (productsData != null) {
      products = productsData;
      notifyListeners();
    } else {
      errorMessage =
          "Failed to get product data, check your internet connection and try again ... ";
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> createProduct({required Product newProduct}) async {
    isCreated = await sl.get<ProductService>().create(newProduct: newProduct);

    if (isCreated) {
      getAllProducts();
    } else {
      errorMessage = "Failed to create a new Product";
      notifyListeners();
    }
  }
}
