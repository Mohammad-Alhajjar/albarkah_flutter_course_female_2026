import 'package:flutter/material.dart';
import 'package:resposive_adaptive/widgets/app_drawer.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  // ! build function for explain concept
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.pink,
  //     body: OrientationBuilder(
  //       builder: (context, orentation) {
  //         if (orentation == Orientation.portrait) {
  //           return Center(
  //             child: Text("Mobile, Portrait", style: TextStyle(fontSize: 50)),
  //           );
  //         } else {
  //           return Center(
  //             child: Text("Mobile, Landscape", style: TextStyle(fontSize: 50)),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  // ! build function for building adaptive app example
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      drawer: AppDrawer(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
