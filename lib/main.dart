import 'package:bloc_example/blocs/product_bloc/product_bloc.dart';
import 'package:bloc_example/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductsPage(),
      ),

      // home: CounterPage()
    );
  }
}
