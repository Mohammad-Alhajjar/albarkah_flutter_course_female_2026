import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // fixedSize: Size(200, 50),
                // minimumSize: Size(150, 50),
                maximumSize: Size(200, 50),
              ),
              child: Text("Login Login Login"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            SizedBox(height: 10),
            OutlinedButton(onPressed: () {}, child: Text("Login")),
            SizedBox(height: 10),
            TextButton(onPressed: () {}, child: Text("Login")),
            SizedBox(height: 10),
            FloatingActionButton(onPressed: () {}, child: Text("Login")),
            SizedBox(height: 10),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text("Login"),
              icon: Icon(Icons.login),
            ),
            SizedBox(height: 10),
            IconButton(onPressed: () {}, icon: Icon(Icons.login)),
          ],
        ),
      ),
    );
  }
}
