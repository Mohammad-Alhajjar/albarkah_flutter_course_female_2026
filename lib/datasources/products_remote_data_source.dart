import 'package:favorite_example/core/const/temp_data.dart';
import 'package:favorite_example/models/products_model.dart';

class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(seconds: 3));
    List<ProductModel> products = List.generate(jsonData.length, (index) {
      return ProductModel.fromMap(jsonData[index]);
    });
    return products;
  }
}
