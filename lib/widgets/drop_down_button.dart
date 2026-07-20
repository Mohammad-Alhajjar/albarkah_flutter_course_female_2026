import 'package:flutter/material.dart';

class MyDropdownScreen extends StatefulWidget {
  const MyDropdownScreen({super.key});

  @override
  State<MyDropdownScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyDropdownScreen> {
  List<String> myCars = ['bmw', 'Jeep', 'Range Rover'];
  String? myValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Hello, my friends.",
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "DropdownButton",
                style: TextStyle(color: Colors.cyan, fontSize: 30),
              ),
            ),
            const SizedBox(height: 30),
            DropdownButton<String>(
              hint: const Text("Select a car"),
              value: myValue,

              isExpanded: true,
              dropdownColor: Colors.blue.shade50,
              icon: const Icon(Icons.arrow_drop_down_circle),
              iconSize: 28,
              iconEnabledColor: Colors.redAccent,
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              underline: Container(),

              // 0
              //
              //items: myCars.map((car) {
              //   return DropdownMenuItem<String>(
              //     value: car,
              //     child: Text(
              //       car,
              //       style: const TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   );
              // }).toList(),
              items: [
                DropdownMenuItem(value: myCars[0], child: Text(myCars[0])),
                DropdownMenuItem(value: myCars[1], child: Text(myCars[1])),
                DropdownMenuItem(value: myCars[2], child: Text(myCars[2])),
              ],
              onChanged: (value) {
                setState(() {
                  myValue = value;
                });
                print("The car has been selected: $value");
              },
            ),
          ],
        ),
      ),
    );
  }
}
