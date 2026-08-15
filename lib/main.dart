import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_example/core/config/get_it.dart';
import 'package:theme_example/core/providers/theme_provider.dart';

import 'core/theme/app_theme.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider()..loadTheme(),
      child: Builder(
        builder: (context) {
          // context.watch<ThemeProvider>().isDarkTheme;

          return Consumer<ThemeProvider>(
            builder: (context, themProvider, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.ligthTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themProvider.isDarkTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
