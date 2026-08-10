import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_session_manager_example/core/constants/app_keys.dart';

class AppPrefrences {
  final SharedPreferences sharedPreferences;

  AppPrefrences({required this.sharedPreferences});

  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool(AppKeys.isFirstTimeKey, true);
  }

  bool isOnboardingCompleted() {
    bool isCompleted =
        sharedPreferences.getBool(AppKeys.isFirstTimeKey) ?? false;
    return isCompleted;
  }
}
