import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Map View",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
