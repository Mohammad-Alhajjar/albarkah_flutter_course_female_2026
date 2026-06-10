import 'package:flutter/material.dart';
import 'package:onboarding_example/views/home_page.dart';
import 'package:onboarding_example/views/on_boarding_page_2.dart';
import 'package:onboarding_example/views/on_boarding_page_3.dart';
import 'package:onboarding_example/views/onboarding_page_1.dart';

void main() {
  runApp(MyApp());
}

PageController myController = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: myController,
          scrollDirection: Axis.horizontal,
          reverse: false,
          // physics: AlwaysScrollableScrollPhysics(),
          // physics: NeverScrollableScrollPhysics(),
          physics: BouncingScrollPhysics(),
          children: [
            OnboardingPage1(),
            OnboardingPage2(),
            OnboardingPage3(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}


