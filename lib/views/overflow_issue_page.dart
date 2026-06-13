import 'package:flutter/material.dart';

class OverflowIssuePage extends StatelessWidget {
  const OverflowIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(color: Colors.red, width: 300, height: 300),
            Container(color: Colors.green, width: 300, height: 300),
            Container(color: Colors.blue, width: 300, height: 300),
            Container(color: Colors.yellow, width: 300, height: 300),
            Container(color: Colors.pink, width: 300, height: 300),
          ],
        ),
      ),
    );
  }
}
