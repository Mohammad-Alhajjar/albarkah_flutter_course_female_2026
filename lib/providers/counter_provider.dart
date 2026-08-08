import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifeirProvider extends Notifier<int> {
  // int counter = 0;
  @override
  int build() {
    // return counter;
    return 0;
  }

  void increment() {
    state++;
    // counter++;
    // print("counter value: $counter");
    print("------------------------------------");
    print("state value: $state");
  }

  void decrement() {
    state--;
    // counter--;
    // print("counter value: $counter");
    print("------------------------------------");
    print("state value: $state");
  }

  void reset() {
    state = 0;
    // counter = 0;
    // print("counter value: $counter");
    print("------------------------------------");
    print("state value: $state");
  }
}
