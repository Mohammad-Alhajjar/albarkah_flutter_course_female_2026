import 'package:flutter/material.dart';
import 'package:resposive_adaptive/widgets/app_drawer.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  // @override
  // Widget build(BuildContext context) {
  // return Scaffold(
  //   backgroundColor: Colors.purple,
  //   body: Center(child: Text("Tablet", style: TextStyle(fontSize: 50))),
  // );
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: screenWidth > 900 ? null : AppBar(title: Text("Home Page")),
      drawer: AppDrawer(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 1,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
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
