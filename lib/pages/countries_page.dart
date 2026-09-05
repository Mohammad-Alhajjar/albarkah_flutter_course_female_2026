import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/country_provider.dart';

class CountriesPage extends ConsumerWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesReult = ref.watch(countriesProvider);
    return Scaffold(
      body: Center(
        child: countriesReult.when(
          data: (countries) => ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(countries[index].name!),
                  subtitle: Text(
                    "${countries[index].capital} - ${countries[index].currency}",
                  ),
                ),
              );
            },
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
