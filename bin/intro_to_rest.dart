// ignore_for_file: strict_top_level_inference

import 'package:dio/dio.dart';

void main() {
  getPosts();
}

getPosts() async {
  Dio dio = Dio();
  print("--------------Loading------------------");
  Response response = await dio.get(
    "https://jsonplaceholder.typicode.com/posts",
  );
  print("--------------Success------------------");
  print(response.statusCode);
  print("======================================================");
  print(response.data);
}
