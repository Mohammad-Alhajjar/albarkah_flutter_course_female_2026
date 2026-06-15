import 'package:flutter/material.dart';
import 'package:grid_view_widgets/views/list_laptop_with_grid_view_builder_page.dart';
import 'package:grid_view_widgets/views/user_input_page.dart';

import 'views/list_containers_with_grid_view_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserInputPage());
  }
}
