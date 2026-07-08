import 'package:auth_example/models/login_model.dart';
import 'package:dio/dio.dart';

String token = "";

class AuthService {
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
        token = response.data["accessToken"];
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
