import 'package:flutter/material.dart';

class PopupMenuWidget extends StatefulWidget {
  const PopupMenuWidget({super.key});

  @override
  State<PopupMenuWidget> createState() => _PopupMenuWidgetState();
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  String title = "Popup Menu";
  String item1 = "save";
  String item2 = "edit";
  String item3 = "delete";
  String selectedItem = "No item selected";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text("My File"),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(value: item1, child: Text(item1)),
                  PopupMenuItem<String>(value: item2, child: Text(item2)),
                  PopupMenuItem<String>(value: item3, child: Text(item3)),
                ];
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Selected Item: $selectedItem",
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
