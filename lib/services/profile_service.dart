import 'package:auth_example/models/profile_model.dart';
import 'package:auth_example/services/auth_service.dart';
import 'package:dio/dio.dart';

class ProfileService {
  Dio dio = Dio();
  late Response response;
  final String url = "https://dummyjson.com/auth/me";

  Future<ProfileModel?> getProfile() async {
    try {
      response = await dio.get(url,
      options: Options(
        headers: {
          "Authorization" : "Bearer $token"
        }
      )
      );
      if (response.statusCode == 200) {
        ProfileModel profile = ProfileModel.fromMap(response.data);
        return profile;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
