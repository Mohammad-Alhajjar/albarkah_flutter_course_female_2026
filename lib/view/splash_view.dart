import 'package:auth_example/core/config/service_locator.dart';
import 'package:auth_example/main.dart';
import 'package:auth_example/view/login_view.dart';
import 'package:auth_example/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              getIt.get<SharedPreferences>().getString("token") != null ? ProfileView() : LoginView(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Icon(Icons.facebook, size: 100)));
  }
}
