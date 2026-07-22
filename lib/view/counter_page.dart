import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
          builder: (BuildContext context, int value, _) {
            return Text(value.toString());
          },
        ),
      ),
    );
  }
}
