import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/core/config/di.dart';
import 'package:provider_state_management/providers/counter_provider.dart';

import 'views/counter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}
