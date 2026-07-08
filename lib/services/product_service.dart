import 'package:dio/dio.dart';
import 'package:rest_api_session_14/core/services/base_service.dart';
import 'package:rest_api_session_14/models/product_model.dart';

class ProductService extends BaseService<ProductModel> {
  final String entity = "products";

  @override
  Future<List<ProductModel>?> getAll() async {
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

  @override
  Future<ProductModel?> getOne({required int itemId}) async {
    try {
      response = await dio.get("$baseUrl/$entity/$itemId");
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

  @override
  Future<bool> create({required ProductModel newItem}) async {
    try {
      response = await dio.post("$baseUrl/$entity", data: newItem.toMap());
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

  @override
  Future<bool> update({required ProductModel updatedItem}) async {
    try {
      response = await dio.put(
        "$baseUrl/$entity/${updatedItem.id}",
        data: updatedItem.toMap(),
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

  @override
  Future<bool> delete({required int deletedItemId}) async {
    try {
      response = await dio.delete("$baseUrl/$entity/$deletedItemId");
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
