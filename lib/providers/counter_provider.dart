import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void increament() {
    counter++;
    notifyListeners();
  }

  void decreament() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }

  void reset() {
    counter = 0;
    notifyListeners();
  }
}
