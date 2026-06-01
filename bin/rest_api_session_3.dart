import 'dart:math';

import 'services/car_service.dart';
import 'models/car_model.dart';
import 'helpers/extensions.dart';

Future<void> main() async {
  CarService carService = CarService();
  List<CarModel>? result = await carService.getAllCars();

  if (result != null) {
    for (var car in result) {
      print(car.toString());
      print("---------------------------------------");
    }
  } else {
    print(
      "=========================Error: getAllCars Function============================",
    );
  }
  print("======================");

  CarModel? car = await carService.getOneCar(carId: 10);
  if (car != null) {
    print(car.toString());
  } else {
    print(
      "=========================Error: getOneCar Function============================",
    );
  }
  print("======================");

  bool isCarCraeted = await carService.createCar(
    newCar: CarModel(
      id: "-1",
      name: "Audi",
      // carPlatte: 11111111,
      image:
          "https://hips.hearstapps.com/hmg-prod/images/2025-audi-q7-pr-101-68d3faa26a43c.jpg",
    ),
  );
  if (isCarCraeted) {
    print("Success ---------------------- new car created --------------");
    List<CarModel>? result = await carService.getAllCars();

    if (result != null) {
      for (var car in result) {
        print(car.toString());
        print("---------------------------------------");
      }
    } else {
      print(
        "=========================Error: getAllCars Function============================",
      );
    }
  } else {
    print("--------------------Failure while creating new car -------------");
  }

  // ! Stream Concept With Extension
  Stream<double> stream = getTempretureSrvice();
  stream.listen((double data) {
    if (!data.isCritical()) {
      print("current temp: ${data.printTempInC()}");
    } else {
      print("Dangrous ---------------------------");
      print("the tempreture is to high: ${data.printTempInC()}");
    }
  });

  double testValue = 10;
  testValue.printTempInC();
}

Stream<double> getTempretureSrvice() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    double currentTemp = 35.0 + Random().nextDouble() * 7;
    yield currentTemp;
  }
}
