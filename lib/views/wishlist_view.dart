import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          "Whishlist View",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
