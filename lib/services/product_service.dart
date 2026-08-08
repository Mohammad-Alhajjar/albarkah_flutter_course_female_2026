import 'package:dio/dio.dart';
import 'package:riverpod_session/models/product_model.dart';

class ProductService {
  Dio dio = Dio();

  Future<List<ProductModel>?> getAllProducts() async {
    try {
      Response response = await dio.get("https://fakestoreapi");
      if (response.statusCode == 200) {
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
