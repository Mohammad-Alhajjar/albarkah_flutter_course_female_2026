import 'package:auth_example/core/config/service_locator.dart';
import 'package:auth_example/services/auth_service.dart';
import 'package:auth_example/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/login_view.dart';

// late final SharedPreferences storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  // storage = await SharedPreferences.getInstance();
  // storage.clear();

  // getIt.get<SharedPreferences>().remove("token");

  AuthService auth1 = getIt.get<AuthService>();
  AuthService auth2 = getIt.get<AuthService>();

  print(auth1 == auth2);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashView());
  }
}
