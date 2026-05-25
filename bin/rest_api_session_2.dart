import 'package:dio/dio.dart';
import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
class A {}

Future<void> main() async {
  // ! Future Concept
  print("hello from the present...");
  await loadData();
  print("hello from the future after the future 5 sec...");
  print(
    " =======================================================================================",
  );

  // ! Service Layer

  // getProductsWithHttp();

  Map<String, dynamic>? result = await getProductsWithDio();
  // print(result["products"]);
  // print(result);
  if (result != null) {
    List<ProductModel> products = [];
    for (var i = 0; i < result["products"].length; i++) {
      ProductModel product = ProductModel.fromMap(result["products"][i]);
      products.add(product);
    }
    print("Serliazation Method Done!");
    print("----------------------------------------------------");
    for (var i = 0; i < products.length; i++) {
      // print("prodcuts #${i + 1}");
      // print("id: ${result["products"][i]["id"]}");
      // print("title: ${result["products"][i]["title"]}");
      // print("price: ${result["products"][i]["price"]}");

      print("prodcuts #${i + 1}");
      print("prodcut model object: ${products[i].toString()}");
      print("id: ${products[i].id}");
      print("title: ${products[i].title}");
      print("description: ${products[i].description}");
      print("price: ${products[i].price}");
    }
  } else {
    print("failure while fetching data, try again later....");
  }

  // ! == operator example

  A a1 = A();
  A a2 = A();

  print(a1 == a2);
}

Future<void> loadData() async {
  await Future.delayed(Duration(seconds: 0), () {
    print("Hello from the future, delayed for 5 sec....");
  });
}

Future<Map<String, dynamic>?> getProductsWithDio() async {
  Dio dio = Dio();
  try {
    Response response = await dio.get("https://dummyjson.com/products");
    return response.data;
  } catch (e) {
    print(e);
    return null;
  }
}

// Future<void> getProductsWithHttp() async {
//   Uri uri = Uri.parse("https://dummyjson.com/products");
//   Response response = await http.get(uri);

//   Map<String, dynamic> result = jsonDecode(response.body);

//   print(result["products"]);
// }

class ProductModel {
  int id;
  String title;
  String description;
  double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      price: map["price"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
    };
  }

  @override
  String toString() {
    return "ProductModel(id: $id, title: $title, description: $description, price: $price)";
  }
}
