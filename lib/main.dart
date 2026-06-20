import 'package:flutter/material.dart';
import 'package:splash_page_bottom_bar_drawer/views/splash_view.dart';

import 'widgets/main_navigation_bar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
