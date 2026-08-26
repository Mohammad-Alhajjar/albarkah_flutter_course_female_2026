import 'package:check_connection_example/core/providers/conecction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
          child: Text(
            "Connected",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
