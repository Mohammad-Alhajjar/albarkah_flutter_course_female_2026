import 'package:flutter/material.dart';

class ListProductsWithListViewSeperatedPage extends StatelessWidget {
  const ListProductsWithListViewSeperatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          print("item builder index: $index");
          return Container(
            // margin: EdgeInsets.only(bottom: 10),
            color: Colors.green,
            width: 300,
            height: 300,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          print("separator builder index: $index");
          return Divider(
            color: Colors.black,
            height: 30,
            thickness: 10,
            indent: 30,
            endIndent: 30,
            radius: BorderRadius.circular(30),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
