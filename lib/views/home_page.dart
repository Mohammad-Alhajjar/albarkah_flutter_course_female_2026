import 'package:flutter/material.dart';

class HomePageWithStatelessWidget extends StatelessWidget {
  HomePageWithStatelessWidget({super.key});
  double containerHeight = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: containerHeight,
          color: Colors.red,
          child: Center(
            child: InkWell(
              onTap: () {
                print("before: $containerHeight");
                containerHeight = 500;
                print("after: $containerHeight");
              },
              child: Container(
                color: Colors.blue,
                width: 200,
                height: 50,
                child: Center(
                  child: const Text(
                    "Click here!",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageWithStatefulWidget extends StatefulWidget {
  const HomePageWithStatefulWidget({super.key});
  @override
  State createState() {
    return HomePageWithStatefulWidgetState();
  }
}

class HomePageWithStatefulWidgetState extends State {
  double containerHeight = 400;
  Color containerColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    print("build function called");
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: containerHeight,
          color: containerColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    print("before: $containerHeight");
                    containerHeight = 600;
                    print("after: $containerHeight");

                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Text(
                            "change height",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    containerColor = Colors.cyan;
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Container(
                        color: Colors.yellow,
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Text(
                            "change color",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
