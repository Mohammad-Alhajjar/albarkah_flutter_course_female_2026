import 'package:bloc_example/blocs/product_bloc/product_bloc.dart';
import 'package:bloc_example/pages/products_page_with_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helpers/bloc_observer.dart';
import 'pages/counter_page.dart';
import 'pages/products_page_with_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductsPageWithCubit(),
      ),

      // home: CounterPage()
    );
  }
}
