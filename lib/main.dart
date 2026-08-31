import 'package:cart_example/blocs/cart_bloc/cart_bloc.dart';
import 'package:cart_example/models/cart_item.dart';
import 'package:cart_example/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CartItemAdapter());

  Box<CartItem> cartBox = await Hive.openBox<CartItem>("cart_box");

  runApp(MyApp(cartBox: cartBox));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.cartBox});
  final Box<CartItem> cartBox;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(cartBox: cartBox)..add(LoadCartItems()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
