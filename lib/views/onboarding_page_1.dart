import 'package:flutter/material.dart';
import 'package:onboarding_example/main.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0, 0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1", style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                print("button clciked");
                // myController.jumpToPage(2);
                myController.animateToPage(
                  2,
                  duration: Duration(seconds: 3),
                  curve: Curves.bounceIn,
                );
              },
              child: Container(
                alignment: Alignment(0, 0),
                decoration: BoxDecoration(
                  color: Color(0xff87B8B5),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                height: 60,
                child: Text(
                  "Go To 3 Page",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                myController.nextPage(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                );
              },
              child: Container(
                alignment: Alignment(0, 0),
                decoration: BoxDecoration(
                  color: Color(0xff87B8B5).withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                height: 60,
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
