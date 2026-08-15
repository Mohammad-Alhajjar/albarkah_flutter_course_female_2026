import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_session/models/product_model.dart';
import 'package:riverpod_session/services/product_service.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

class ProductAsyncNotifierProvider extends AsyncNotifier<List<ProductModel>> {
  @override
  Future<List<ProductModel>> build() async {
    var productService = ref.read(productServiceProvider);

    // ProductService productService = ProductService();

    List<ProductModel>? productsResult = await productService.getAllProducts();

    if (productsResult == null) {
      throw Exception("failed to fecth data. with build function");
    }

    return productsResult;
  }

  Future<void> refreshProducts() async {
    state = AsyncLoading();

    var productService = ref.read(productServiceProvider);
    List<ProductModel>? productsResult = await productService.getAllProducts();

    if (productsResult == null) {
      state = AsyncError("failed to fecth data. with refresh function", StackTrace.current);
      return;
    }
    state = AsyncData(productsResult);
  }
}
