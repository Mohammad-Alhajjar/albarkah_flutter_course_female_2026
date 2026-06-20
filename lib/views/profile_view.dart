import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(fontSize: 50, color: Colors.black),
        ),
      ),
    );
  }
}
