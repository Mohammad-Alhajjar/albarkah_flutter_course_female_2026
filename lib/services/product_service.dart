import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();
  late Response response;
  final String baseUrl = "https://fakestoreapi";
  final String productEntity = "products";

  Future<List<ProductModel>?> getAllProducts() async {
    try {
      response = await _dio.get("$baseUrl/$productEntity");
      if (response.statusCode == 200) {
        // List<ProductModel> products = [];
        // for (var i = 0; i < response.data.length; i++) {
        //   ProductModel product = ProductModel.fromMap(response.data[i]);
        //   products.add(product);
        // }

        List<ProductModel> products = List.generate(response.data.length, (
          index,
        ) {
          return ProductModel.fromMap(response.data[index]);
        });

        return products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
