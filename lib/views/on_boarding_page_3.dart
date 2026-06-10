
import 'package:flutter/material.dart';
import 'package:onboarding_example/main.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0, 0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("3", style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                myController.animateToPage(
                  0,
                  duration: Duration(seconds: 3),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                alignment: Alignment(0, 0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                height: 60,
                child: Text(
                  "Go To 1 Page",
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
