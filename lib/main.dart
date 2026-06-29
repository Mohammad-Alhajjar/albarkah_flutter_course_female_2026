import 'package:flutter/material.dart';
import 'package:resposive_adaptive/views/adaptive_layout.dart';
import 'package:resposive_adaptive/views/media_query_test_page.dart';
import 'package:resposive_adaptive/views/widgets_for_adaptive_resposive_design_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AdaptiveLayout());
  }
}
