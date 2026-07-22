import 'package:flutter/material.dart';
import 'package:value_notifier_example/view/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(home: CounterPage());
  }
}
