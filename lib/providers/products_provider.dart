import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_example/core/consts/temp_data.dart';
import 'package:search_example/models/product_model.dart';

final productsProvider = Provider<List<ProductModel>>((ref) {
  List<ProductModel> products = List.generate(
    jsonData.length,
    (index) => ProductModel.fromMap(jsonData[index]),
  );
  return products;
});
