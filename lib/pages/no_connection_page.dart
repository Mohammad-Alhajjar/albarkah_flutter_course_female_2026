import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning, color: Colors.white),
              Text(
                "Disconnected",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
