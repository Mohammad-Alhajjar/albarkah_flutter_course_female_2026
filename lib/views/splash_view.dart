import 'package:flutter/material.dart';
import 'package:splash_page_bottom_bar_drawer/widgets/main_navigation_bar_widget.dart';

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
        MaterialPageRoute(builder: (context) => MainNavigationBarWidget()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://img.icons8.com/color/1200/apple-app-store--v1.jpg",
            ),

            Text(
              "AppStore",
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
