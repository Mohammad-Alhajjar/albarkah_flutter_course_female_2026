import 'package:flutter/material.dart';
import 'package:rest_api_session_14/view/products_page_with_future_builder.dart';

import 'view/products_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsPageWithFutureBuilder(),
    );
  }
}
