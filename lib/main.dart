import 'package:clean_arch_example/core/config/di.dart';
import 'package:clean_arch_example/features/home/data/models/post_model.dart';
import 'package:clean_arch_example/features/home/presentation/views/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PostsView());
  }
}
