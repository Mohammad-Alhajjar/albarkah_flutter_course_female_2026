import 'package:dio/dio.dart';

abstract class BaseService<T> {
  Dio dio = Dio();
  late Response response;
  final String baseUrl = "https://fakestoreapi.com";
  Future<List<T>?> getAll();
  Future<T?> getOne({required int itemId});
  Future<bool> create({required T newItem});
  Future<bool> update({required T updatedItem});
  Future<bool> delete({required int deletedItemId});
}
