// ! animal class without abstract

//  class Animal {
//   String name;
//   int age;

//   Animal({required this.name, required this.age});

//   // ! old way to use constructor: Bad Way
//   // Animal({required String name, required int age}) {
//   //   this.name = name;
//   //   this.age = age;
//   // }

//   // ! setData Funcation for init props: Bad Way
//   // void setData({required String animalName, required int animalAge}) {
//   //   name = animalName;
//   //   age = animalAge;
//   // }

//   void makeSound() {
//     print("animal is making sound");
//   }

//   void walk() {
//     print("animal is walking");
//   }
// }

abstract class Animal {
  String name;
  int age;

  Animal({required this.name, required this.age});

  void makeSound();

  void walk();
}
