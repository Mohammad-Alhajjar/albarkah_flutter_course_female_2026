import 'package:get/state_manager.dart';

class CounterControllerWithObs extends GetxController {
  RxInt counter = 0.obs;
  void increment() {
    counter.value++;
  }
}


