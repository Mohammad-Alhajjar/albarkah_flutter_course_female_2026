import 'package:dio/dio.dart';
import '../models/car_model.dart';

class CarService {
  final Dio dio = Dio();
  late Response response;
  final String baseUrl = "https://6a1d7f8abcc4f20d5ca4ab68.mockapi.io/api/v1";
  final String carEntity = "car";

  Future<List<CarModel>?> getAllCars() async {
    try {
      response = await dio.get("$baseUrl/$carEntity");
      List<CarModel> cars = [];
      for (var i = 0; i < response.data.length; i++) {
        CarModel car = CarModel.fromMap(response.data[i]);
        cars.add(car);
      }
      return cars;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CarModel?> getOneCar({required int carId}) async {
    try {
      response = await dio.get("$baseUrl/$carEntity/$carId");
      CarModel car = CarModel.fromMap(response.data);
      return car;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> createCar({required CarModel newCar}) async {
    try {
      response = await dio.post("$baseUrl/$carEntity", data: newCar.toMap());
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
