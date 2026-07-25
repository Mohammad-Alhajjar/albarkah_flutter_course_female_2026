import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:provider_state_management/services/product_service.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ProductService>(ProductService.getInstance());
}
