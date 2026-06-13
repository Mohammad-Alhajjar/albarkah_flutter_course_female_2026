import 'package:flutter/material.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // width: 300,
        child: ListView(
          scrollDirection: Axis.vertical,
          itemExtent: 200,
          padding: EdgeInsets.all(10),
          children: [
            Container(
              margin: EdgeInsets.all(10),
              // margin: EdgeInsets.only(bottom: 30),
              // width: 300,
              // height: 300,
              color: Colors.blue,
            ),
            Container(
              // margin: EdgeInsets.only(bottom: 30),
              margin: EdgeInsets.all(10),
              // width: 300,
              // height: 300,
              color: Colors.blue,
            ),
            Container(
              // margin: EdgeInsets.only(bottom: 30),
              margin: EdgeInsets.all(10),
              // width: 300,
              // height: 300,
              color: Colors.blue,
            ),
            Container(
              // margin: EdgeInsets.only(bottom: 30),
              margin: EdgeInsets.all(10),
              // width: 300,
              // height: 300,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
