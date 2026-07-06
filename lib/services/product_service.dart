import 'package:dio/dio.dart';
import 'package:rest_api_session_14/models/product_model.dart';

class ProductService {
  Dio dio = Dio();
  late Response response;
  final String baseUrl = 'https://fakestoreapi.com';
  final String entity = "products";

  Future<List<ProductModel>?> getAllProducts() async {
    try {
      response = await dio.get("$baseUrl/$entity");
      if (response.statusCode == 200) {
        List<ProductModel> products = [];
        for (var i = 0; i < response.data.length; i++) {
          ProductModel product = ProductModel.fromMap(response.data[i]);
          products.add(product);
        }
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ProductModel?> getOneProduct({required int productId}) async {
    try {
      response = await dio.get("$baseUrl/$entity/$productId");
      if (response.statusCode == 200) {
        ProductModel product = ProductModel.fromMap(response.data);
        return product;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> createProduct({required ProductModel newProduct}) async {
    try {
      response = await dio.post("$baseUrl/$entity", data: newProduct.toMap());
      if (response.statusCode == 201) {
        print(response.data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateProduct({required ProductModel updatedProduct}) async {
    try {
      response = await dio.put(
        "$baseUrl/$entity/${updatedProduct.id}",
        data: updatedProduct.toMap(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteProduct({required int deletedProductId}) async {
    try {
      response = await dio.delete("$baseUrl/$entity/$deletedProductId");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
