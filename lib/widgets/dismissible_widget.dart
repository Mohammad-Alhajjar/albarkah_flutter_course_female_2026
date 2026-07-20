import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  List<Map<String, dynamic>> listItems = [
    {
      "id": 1,
      "image":
          "https://th.bing.com/th/id/OIP.vmEe_-PYxxoZAyvuY0kzRQHaEo?w=210&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      "name": "Lavander",
    },
    {
      "id": 2,
      "image":
          "https://th.bing.com/th/id/OIP.vmEe_-PYxxoZAyvuY0kzRQHaEo?w=210&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      "name": "Lavander",
    },

    {
      "id": 3,
      "image":
          "https://th.bing.com/th/id/OIP.vmEe_-PYxxoZAyvuY0kzRQHaEo?w=210&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      "name": "Lavander",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(listItems[index]['id']),
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.blue,
              child: Icon(Icons.edit, color: Colors.white),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Successfully removed")));
              }
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text(
                        "Are you sure you want to remove this item?",
                      ),
                      actions: <Widget>[
                        FilledButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("No"),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text("yes"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                print("========= Edite ===============");
                return null;
              }
            },
            movementDuration: Duration(seconds: 4),
            resizeDuration: Duration(seconds: 5),
            crossAxisEndOffset: 5,
            //  direction: DismissDirection.endToStart,
            // dismissThresholds: {DismissDirection.startToEnd: 0.8},
            //   behavior: HitTestBehavior.opaque,
            child: Container(
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(listItems[index]['image']),
                  Text(
                    listItems[index]['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
