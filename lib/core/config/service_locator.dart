import 'package:auth_example/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.registerSingleton<AuthService>(AuthService.getInstance());
}
