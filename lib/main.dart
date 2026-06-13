import 'package:flutter/material.dart';
import 'package:scrolling_widgets/views/card_page.dart';
import 'package:scrolling_widgets/views/list_products_page.dart';
import 'package:scrolling_widgets/views/list_products_with_list_view_seperated_page.dart';
import 'package:scrolling_widgets/views/list_products_with_listview_builder_page.dart';

import 'views/overflow_issue_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CardPage());
  }
}
