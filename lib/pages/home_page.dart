import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_example/core/providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return Switch(
                value: themeProvider.isDarkTheme,
                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            FilledButton(onPressed: () {}, child: Text("bla bla")),
            ElevatedButton(onPressed: () {}, child: Text("bla bla")),
            Text("Hello Flutter", style: Theme.of(context).textTheme.bodyLarge),
            Text("Theme Example", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
