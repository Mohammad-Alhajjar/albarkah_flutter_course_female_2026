import 'package:flutter/material.dart';

class ListLaptopWithGridViewBuilderPage extends StatelessWidget {
  ListLaptopWithGridViewBuilderPage({super.key});

  List<Map<String, dynamic>> laptops = [
    // {"name": "ASUS", "CPU": "Core 5 ultra 270H"},
    {"name": "DEll", "CPU": "Core 5 ultra 270H"},
    {"name": "Acer", "CPU": "Core 5 ultra 270H"},
    {"name": "HP", "CPU": "Core 5 ultra 270H"},
    {"name": "Lenovo", "CPU": "Core 5 ultra 270H"},
    {"name": "Macbook", "CPU": "Core 5 ultra 270H"},
    {"name": "MSI", "CPU": "Core 5 ultra 270H"},
    {"name": "SAMSUNG", "CPU": "Core 5 ultra 270H"},
    {"name": "SONY", "CPU": "Core 5 ultra 270H"},
    {"name": "Aleinware", "CPU": "Core 5 ultra 270H"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("All Laptops", style: TextStyle(fontSize: 40)),
          Expanded(
            child: GridView.builder(
              itemCount: laptops.length,
              padding: EdgeInsets.all(10),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 4,
              //   mainAxisSpacing: 30,
              //   crossAxisSpacing: 30,
              // ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                // childAspectRatio: 16 / 9,
                mainAxisExtent: 600,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.purple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        laptops[index]["name"],
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        laptops[index]["CPU"],
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
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
