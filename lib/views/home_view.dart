import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "Home View",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
