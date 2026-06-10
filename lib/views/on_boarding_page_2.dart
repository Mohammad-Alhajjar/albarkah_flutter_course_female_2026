import 'package:flutter/material.dart';
import 'package:onboarding_example/main.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0, 0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("2", style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
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
                  color: Colors.lightBlue,
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
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                myController.previousPage(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
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
                  "Previous",
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
