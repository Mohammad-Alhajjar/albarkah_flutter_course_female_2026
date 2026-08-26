import 'package:check_connection_example/core/providers/conecction_provider.dart';
import 'package:check_connection_example/pages/no_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkConnection = ref.watch(connectionProvider);
    return MaterialApp(
      home: checkConnection.when(
        data: (isConnected) {
          return isConnected ? HomePage() : NoConnectionPage();
        },
        error: (error, stackTrace) {
          return Center(child: Text("Error"));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
