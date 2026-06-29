import 'package:flutter/material.dart';
import 'package:resposive_adaptive/views/tablet_layout.dart';
import 'package:resposive_adaptive/widgets/app_drawer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.teal,
  //     body: Center(child: Text("Desktop", style: TextStyle(fontSize: 50))),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: AppDrawer()),
          Expanded(flex: 2, child: TabletLayout()),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
