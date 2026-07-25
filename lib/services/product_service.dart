// ignore_for_file: prefer_conditional_assignment

import 'package:dio/dio.dart';
import 'package:provider_state_management/models/product_model.dart';

import '../core/config/di.dart';

class ProductService {
  ProductService._();
  static ProductService? _instance;
  static ProductService getInstance() {
    if (_instance == null) {
      _instance = ProductService._();
    }
    return _instance!;
  }

  final Dio dio = sl.get<Dio>();
  late Response response;
  final String baseUrl = "https://dummyjson.com";

  Future<List<Product>?> getAll() async {
    try {
      response = await dio.get("$baseUrl/products");
      if (response.statusCode == 200) {
        ProductModel productModel = ProductModel.fromMap(response.data);
        return productModel.products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> create({required Product newProduct}) async {
    try {
      response = await dio.post(
        "$baseUrl/products/add",
        data: newProduct.toMap(),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        print("else case ============================");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
