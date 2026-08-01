import 'package:get/state_manager.dart';

class CounterControllerWithBuilder extends GetxController{
  int counter = 0;

  void increment() {
    counter++;
    update();
  }
}
