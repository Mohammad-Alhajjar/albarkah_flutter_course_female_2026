import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: SizedBox(
          width: 800,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(20, 20),
                      color: Colors.grey,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.orangeAccent, width: 5),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  border: Border.all(color: Colors.orangeAccent, width: 5),
                ),
                child: Text("hello"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.home)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello Flutter",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      wordSpacing: 30,
                      letterSpacing: 10,
                      // fontFamily:
                    ),
                  ),
                ],
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(color: Colors.orangeAccent, width: 5),
                ),
              ),
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(color: Colors.orangeAccent, width: 5),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(color: Colors.orangeAccent, width: 5),
                    ),
                    child: Image.network(
                      "https://assets.bonappetit.com/photos/5b919cb83d923e31d08fed17/1:1/w_2560%2Cc_limit/basically-burger-1.jpg",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 5,
                        ),
                      ),
                      child: Image.asset("assets/burger.jpg", fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
