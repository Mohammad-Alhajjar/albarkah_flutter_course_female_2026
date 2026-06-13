import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 540,
          child: Card(
            shadowColor: Colors.amber,
            elevation: 10,
            surfaceTintColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ91itiKC99tCMfpdbtqN_cPbujAXhRwEgidw&s",
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Syrian Pizza",
                        style: TextStyle(fontSize: 30, color: Colors.green),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Voluptate excepteur aliquip irure cillum eu voluptate ut dolore pariatur. Exercitation sit aute reprehenderit nisi irure et id amet ut consequat aute fugiat proident. Velit aliquip eu proident nostrud reprehenderit.",
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment(0, 0),
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Buy",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            alignment: Alignment(0, 0),
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Buy",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
