// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:favorite_example/datasources/products_remote_data_source.dart';
import 'package:favorite_example/models/products_model.dart';

class ProductRepo {
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductRepo({required this.productsRemoteDataSource});

  Future<List<ProductModel>> getProducts() async {
    return await productsRemoteDataSource.getProducts();
  }
}
