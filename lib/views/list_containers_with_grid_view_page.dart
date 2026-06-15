import 'package:flutter/material.dart';

class ListContainersWithGridViewPage extends StatelessWidget {
  const ListContainersWithGridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("All Containers", style: TextStyle(fontSize: 40)),
          SizedBox(
            height: 600,
            child: GridView(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 16 / 9,
                mainAxisExtent: 400,
              ),
              children: [
                Container(color: Colors.green),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
                Container(color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
