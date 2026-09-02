// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pagination_example/datasources/product_remote_datasource.dart';
import 'package:pagination_example/models/product_model.dart';

class ProductRepository {
  ProductRemoteDatasource remoteDatasource;
  ProductRepository({required this.remoteDatasource});

  Future<List<ProductModel>?> getProductsPagination({
    required int limit,
    required int skip,
  }) {
    return remoteDatasource.getProdcuts(limit: limit, skip: skip);
  }
}
