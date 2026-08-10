// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:user_session_manager_example/core/models/user_session.dart';
import 'package:user_session_manager_example/core/storage/secure_session_storage.dart';
import 'package:user_session_manager_example/models/login_model.dart';

import '../core/storage/app_prefrences.dart';

class AuthService {
  SecureSessionStorage secureSessionStorage;
  AppPrefrences appPrefrences;
  // Dio dio;
  AuthService({
    required this.secureSessionStorage,
    required this.appPrefrences,
    //  required this.dio
  });
  Future<void> login({required LoginModel loginModel}) async {
    // Response response = await dio.post("url", data: loginModel.toMap());

    await Future.delayed(Duration(seconds: 3));
    secureSessionStorage.saveSession(
      userSession: UserSession(
        accessToken: "fake access token",
        refreshToken: "fake refesh token",
      ),
    );
  }

  Future<void> register({required LoginModel loginModel}) async {
    // Response response = await dio.post("url", data: loginModel.toMap());

    await Future.delayed(Duration(seconds: 3));
    secureSessionStorage.saveSession(
      userSession: UserSession(
        accessToken: "fake access token",
        refreshToken: "fake refesh token",
      ),
    );
  }

  Future<void> logout() async {
    // UserSession? userSession = await secureSessionStorage.getSession();
    // if (userSession != null) {}
    // Response response = await dio.post(
    //   "api/logout",
    //   options: Options(
    //     header: {
    //       "access_token": userSession.accessToken,
    //       "refresh_token": userSession.refreshToken,
    //     },
    //   ),
    // );

    secureSessionStorage.clearSession();
  }

  bool isCompleteOnboarding() {
    return appPrefrences.isOnboardingCompleted();
  }

  Future<bool> isAuthenticated() async {
    UserSession? userSession = await secureSessionStorage.getSession();
    return userSession != null ? true : false;
  }
}
