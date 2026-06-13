import 'package:flutter/material.dart';

class ListProductsWithListviewBuilderPage extends StatelessWidget {
  ListProductsWithListviewBuilderPage({super.key});

  List<Map<String, dynamic>> users = [
    {"name": "Mohammad", "email": "mohammad@gmail.com"},
    {"name": "Noor", "email": "mohammad@gmail.com"},
    {"name": "Ahamd", "email": "mohammad@gmail.com"},
    {"name": "Essra", "email": "mohammad@gmail.com"},
    {"name": "Abd", "email": "mohammad@gmail.com"},
    {"name": "Noura", "email": "mohammad@gmail.com"},
    {"name": "Mohammad", "email": "mohammad@gmail.com"},
    {"name": "Mohammad", "email": "mohammad@gmail.com"},
    {"name": "Mohammad", "email": "mohammad@gmail.com"},
    {"name": "Mohammad", "email": "mohammad@gmail.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemExtent: 200,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(30),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          print(index);
          return Container(
            alignment: Alignment(0, 0),
            margin: EdgeInsets.only(bottom: 10),
            width: 300,
            height: 300,
            color: Colors.blue.withValues(alpha: (index / 10) + 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(users[index]["name"], style: TextStyle(fontSize: 50)),
                Text(users[index]["email"], style: TextStyle(fontSize: 26)),
              ],
            ),
          );
        },
      ),
    );
  }
}
