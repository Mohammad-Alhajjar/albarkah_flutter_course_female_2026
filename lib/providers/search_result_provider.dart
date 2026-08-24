import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_example/models/product_model.dart';
import 'package:search_example/providers/search_query_provider.dart';

import 'products_provider.dart';


final searchResultProvider = Provider<List<ProductModel>>((ref) {
  List<ProductModel> products = ref.watch(productsProvider);
  String query = ref.watch(searchQueryProvider);

  if (query.trim().toLowerCase().isEmpty) {
    return products;
  }

  List<ProductModel> searchedProducts = products.where((element) {
    return element.title!.toLowerCase().contains(query.trim().toLowerCase());
  }).toList();
  return searchedProducts;
});
