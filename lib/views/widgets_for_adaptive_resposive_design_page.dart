import 'package:flutter/material.dart';

class WidgetsForAdaptiveResposiveDesignPage extends StatelessWidget {
  const WidgetsForAdaptiveResposiveDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.amber,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.deepOrange,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.blue,
              child: FittedBox(child: Icon(Icons.abc)),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.green,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 0.8,
                  child: Container(color: Colors.pink),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                  CircleAvatar(radius: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
