// ignore_for_file: unused_field

import 'animal.dart';

class Dog extends Animal {
  String breed;
   int _health = 100;
  Dog({required super.name, required super.age, required this.breed});

  @override
  void makeSound() {
    print("Dog $name is making sound: Waof Waof!");
  }

  @override
  void walk() {
    print("Dog $name is walking");
  }
}
