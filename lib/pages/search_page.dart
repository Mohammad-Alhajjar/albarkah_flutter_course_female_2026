import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_example/models/product_model.dart';
import 'package:search_example/providers/search_query_provider.dart';
import 'package:search_example/providers/search_result_provider.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
                    List<ProductModel> searchedProducts = ref.watch(
                  searchResultProvider,
                );
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchQueryProvider.notifier).updateQuery(query: value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedProducts.length,
              itemBuilder: (context, index) {

                return Card(
                  child: ListTile(
                    title: Text(searchedProducts[index].title!),
                    subtitle: Text(searchedProducts[index].description!),
                    trailing: Text(searchedProducts[index].price!.toString()),
                    leading: CircleAvatar(
                      child: Text(searchedProducts[index].id!.toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
