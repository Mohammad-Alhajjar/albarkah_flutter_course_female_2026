import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/counter_controller_obs.dart';

import '../controllers/counter_controller_with_builder.dart';

class CounterPageWithObs extends StatelessWidget {
  const CounterPageWithObs({super.key});

  @override
  Widget build(BuildContext context) {
    CounterControllerWithObs counterController =
        Get.put<CounterControllerWithObs>(CounterControllerWithObs());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Obx(() {
          return Text(
            counterController.counter.value.toString(),
            style: TextStyle(fontSize: 50),
          );
        }),
      ),
    );
  }
}



class CounterPageWithBuilder extends StatelessWidget {
  const CounterPageWithBuilder({super.key});

  @override
  Widget build(BuildContext context) {

    CounterControllerWithBuilder counterController =
        Get.put<CounterControllerWithBuilder>(CounterControllerWithBuilder());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: GetBuilder(
          init: counterController,
          builder:  (controller) {
          return Text(
            controller.counter.toString(),
            style: TextStyle(fontSize: 50),
          );
        }),
      ),
    );
  }
}
