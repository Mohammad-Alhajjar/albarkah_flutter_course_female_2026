import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            SizedBox(height: 10),
            ListTile(
              tileColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(width: 5, color: Colors.red),
              ),
              title: Text("Asus vivobook"),
              subtitle: Text("CPU: core i5-13600H, GPU: RTX 3050"),
              leading: Icon(Icons.laptop),
              trailing: Text("900\$"),
            ),
          ],
        ),
      ),
    );
  }
}
