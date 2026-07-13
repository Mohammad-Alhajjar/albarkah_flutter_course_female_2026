// ignore_for_file: strict_top_level_inference, prefer_conditional_assignment

import 'package:auth_example/core/config/service_locator.dart';
import 'package:auth_example/main.dart';
import 'package:auth_example/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String token = "";

class AuthService {
  
  AuthService._();

  static AuthService? _instance;

  static getInstance() {
    if (_instance == null) {
      _instance = AuthService._();
    }
    return _instance;
  }

  Dio dio = Dio();
  late Response response;
  final String baseUrl = "https://dummyjson.com/auth";
  final String loginEndpoint = "login";
  Future<bool> login({required LoginModel loginInfo}) async {
    try {
      response = await dio.post(
        "$baseUrl/$loginEndpoint",
        data: loginInfo.toMap(),
      );
      if (response.statusCode == 200) {
        print(response.data["accessToken"]);
        // token = response.data["accessToken"];
        // storage.setString("token", response.data["accessToken"]);
        getIt.get<SharedPreferences>().setString("token", response.data["accessToken"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void signUp() {}
  void logout() {}
}
