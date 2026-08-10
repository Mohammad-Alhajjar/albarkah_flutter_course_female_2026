import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_session_manager_example/core/constants/app_keys.dart';
import 'package:user_session_manager_example/core/models/user_session.dart';

class SecureSessionStorage {
  final FlutterSecureStorage secureStorage;
  SecureSessionStorage({required  this.secureStorage});

  Future<void> saveSession({required UserSession userSession}) async {
    await secureStorage.write(
      key: AppKeys.accessTokenKey,
      value: userSession.accessToken,
    );
    await secureStorage.write(
      key: AppKeys.refreshTokenKey,
      value: userSession.refreshToken,
    );
  }

  Future<UserSession?> getSession() async {
    String? accessToken = await secureStorage.read(key: AppKeys.accessTokenKey);
    String? refreshToken = await secureStorage.read(
      key: AppKeys.refreshTokenKey,
    );
    if (accessToken != null && refreshToken != null) {
      UserSession userSession = UserSession(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      return userSession;
    }
    return null;
  }

  Future<void> clearSession() async {
    await secureStorage.delete(key: AppKeys.accessTokenKey);
    await secureStorage.delete(key: AppKeys.refreshTokenKey);
  }
}
