import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
            await ref.set({
              "name": "John",
              "age": 18,
              "address": {"line1": "100 Mountain View"},
            });
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: Text("Home Page")),
    );
  }
}
