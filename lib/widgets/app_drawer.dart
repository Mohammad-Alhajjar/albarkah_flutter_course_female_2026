
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Mohamamd"),
            accountEmail: Text("mohammad@gmail.com"),
          ),
          ListTile(leading: Icon(Icons.abc), title: Text("ABC")),
          ListTile(leading: Icon(Icons.abc), title: Text("ABC")),
          ListTile(leading: Icon(Icons.abc), title: Text("ABC")),
          ListTile(leading: Icon(Icons.abc), title: Text("ABC")),
          ListTile(leading: Icon(Icons.abc), title: Text("ABC")),
          Spacer(),
          ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
        ],
      ),
    );
  }
}
