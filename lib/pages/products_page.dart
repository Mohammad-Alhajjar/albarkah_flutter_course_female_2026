import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_example/providers/product_provider/product_provider.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(productsAsyncProvider.notifier).getProdcutsNextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = ref.watch(productsAsyncProvider);
    return Scaffold(
      body: productsProvider.when(
        data: (data) {
          if (data.products.isEmpty) {
            return Center(child: Text("no products ..."));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: data.products.length + (data.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == data.products.length) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(data.products[index].id.toString()),
                        ),
                        title: Text(data.products[index].title),
                        subtitle: Text("Price: ${data.products[index].price}"),
                        trailing: Image.network(data.products[index].thumbnail),
                      ),
                    );
                  },
                ),
              ),
              if (data.errorMessage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.errorMessage!),
                    FilledButton(
                      onPressed: () {
                        ref
                            .read(productsAsyncProvider.notifier)
                            .getProdcutsNextPage();
                      },
                      child: Text("Retry"),
                    ),
                  ],
                ),
            ],
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
