import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/models/product_model.dart';
import 'package:provider_state_management/providers/counter_provider.dart';
import 'package:provider_state_management/views/products_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Page"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsPage()),
                    );
                  },
                  icon: Icon(Icons.list_alt_rounded),
                ),
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "1",
                  onPressed: () {
                    context.read<CounterProvider>().increament();
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: "2",
                  onPressed: () {
                    context.read<CounterProvider>().decreament();
                  },
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: "3",
                  onPressed: () {
                    context.read<CounterProvider>().reset();
                  },
                  child: Icon(Icons.exposure_zero),
                ),
              ],
            ),
            body: Center(
              child: Text(
                context.watch<CounterProvider>().counter.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}
