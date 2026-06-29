import 'package:flutter/material.dart';

class MediaQueryTestPage extends StatelessWidget {
  const MediaQueryTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          width: screenWidth / 3,
          height: screenHeight / 2,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(screenWidth.toString()),
              Text(screenHeight.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
