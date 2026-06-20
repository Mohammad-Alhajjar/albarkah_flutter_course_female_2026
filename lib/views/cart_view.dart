import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Text(
          "Cart View",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
