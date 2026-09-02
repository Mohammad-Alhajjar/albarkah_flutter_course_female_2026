// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pagination_example/models/product_model.dart';

class ProductRemoteDatasource {
  Dio dio;

  ProductRemoteDatasource({required this.dio});

  Future<List<ProductModel>?> getProdcuts({
    required int limit,
    required int skip,
  }) async {
    try {
      Response response = await dio.get(
        "https://dummyjson.com/products?limit=$limit&skip=$skip",
      );
      return List.generate(
        response.data["products"].length,
        (index) => ProductModel.fromMap(response.data["products"][index]),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
