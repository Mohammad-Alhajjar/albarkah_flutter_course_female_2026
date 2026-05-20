import 'animal.dart';
import 'cat.dart';
import 'dog.dart';

void main() {
  // * OOP Basic Concepts
  // Animal spike = Animal(name: "Spike", age: 3);

  // // spike.setData(animalName: 'Spike', animalAge: 3);

  // print(spike.name);
  // print(spike.age);

  // spike.makeSound();
  // spike.walk();

  // Animal rex = Animal(name: "Rex", age: 2);

  // // rex.setData(animalName: "Rex", animalAge: 2);

  // print(rex.name);
  // print(rex.age);

  // rex.makeSound();
  // rex.walk();

  // * Inhertance

  Cat kitty = Cat(name: "Kitty", age: 1, color: "White");

  print(kitty.name);
  print(kitty.age);
  print(kitty.color);

  // print(kitty.getHealth());
  print(kitty.health);

  // kitty.setHealth(70);
  kitty.health = 70;
  // print(kitty.getHealth());
  print(kitty.health);

  // kitty.setHealth(-1000);
  kitty.health = -1000;
  // print(kitty.getHealth());
  print(kitty.health);

  kitty.makeSound();
  kitty.walk();

  Dog topy = Dog(name: "Topy", age: 4, breed: "Gold American");

  print(topy.name);
  print(topy.age);
  print(topy.breed);

  topy.makeSound();
  topy.walk();

  Animal animalTest = Cat(name: "test", age: 0, color: "testColor");
  print(animalTest.name);
  print(animalTest.age);
  // print(animalTest.color);

  animalTest.makeSound();
  animalTest.walk();
  print(animalTest.runtimeType);

  num number = 10.5;
  print(number.runtimeType);

  // ! Can't Make a value of superclass inside object of subclass
  // Dog dogTest = Animal(name: "dogTest", age: 0) as Dog;
  // print(dogTest.name);
  // print(dogTest.age);
  // print(dogTest.breed);

  // print(dogTest.runtimeType);
  // dogTest.makeSound();
  // dogTest.walk();

  play(kitty);
  play(topy);
}

void play(Animal animal) {
  if (animal.runtimeType == Cat) {
    print("cat is playing with ball");
  } else if (animal.runtimeType == Dog) {
    print("dog is playing with plate");
  }
}
