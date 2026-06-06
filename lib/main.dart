import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text("data"))),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          leading: FlutterLogo(),
          title: Text("Home Page"),
          actions: [FlutterLogo(), FlutterLogo(), FlutterLogo()],
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.brown, width: 5),
              // ! LinearGradient
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // ! RadialGradient
              // gradient: RadialGradient(
              //   colors: [Colors.deepOrange, Colors.lightBlueAccent],
              //   radius: 0.8,
              // ),
              // gradient: SweepGradient(
              //   colors: [Colors.deepOrange, Colors.lightBlueAccent],
              // ),
              // shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(10, 10),
                  blurRadius: 20,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-10, -10),
                  blurRadius: 20,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: Icon(Icons.home, size: 100, color: Colors.white38),
            ),
          ),
        ),
      ),
    );
  }
}
