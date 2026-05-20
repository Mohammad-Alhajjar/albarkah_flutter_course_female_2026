// ignore_for_file: unused_field, prefer_final_fields

import 'animal.dart';

class Cat extends Animal {
  String color;
  int _health = 100;
  Cat({required super.name, required super.age, required this.color});

  set health(int amount) {
    if (amount >= 100 || amount < 0) {
      print("the healthy amount must be between 0 and 100");
    } else {
      _health = amount;
    }
  }

  // void setHealth(int amount) {
  //   if (amount >= 100 || amount < 0) {
  //     print("the healthy amount must be between 0 and 100");
  //   } else {
  //     _health = amount;
  //   }
  // }

  int get health {
    return _health;
  }

  // int getHealth() {
  //   return _health;
  // }

  @override
  void makeSound() {
    print("Cat ${super.name} is making sound: Meao Meao!");
  }

  @override
  void walk() {
    print("Cat $name is walking");
  }

  void eat() {
    print("eating");
  }
}
