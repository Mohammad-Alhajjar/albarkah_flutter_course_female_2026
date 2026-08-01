import 'package:bloc_example/blocs/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/product_with_cubit_cubit.dart';

class ProductsPageWithCubit extends StatefulWidget {
  const ProductsPageWithCubit({super.key});

  @override
  State<ProductsPageWithCubit> createState() => _ProductsPageWithCubitState();
}

class _ProductsPageWithCubitState extends State<ProductsPageWithCubit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductWithCubitCubit()..getAllProducts(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("Products Page")),

            // ! body using only consumer
            body: Center(
              child: BlocConsumer<ProductWithCubitCubit, ProductWithCubitState>(
                builder: (BuildContext context, ProductWithCubitState state) {
                  if (state is ProductWithCubitLoading || state is ProductInitial) {
                    return CircularProgressIndicator();
                  } else if (state is ProductFailure) {
                    return Icon(Icons.warning, size: 150, color: Colors.red);
                  } else if (state is ProductWithCubitSuccess) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              state.products[index].image!,
                            ),
                            title: Text(state.products[index].title),
                            subtitle: Text(
                              state.products[index].description ??
                                  "no description",
                            ),
                            trailing: Text(
                              state.products[index].price.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
                listener: (BuildContext context, ProductWithCubitState state) {
                  if (state is ProductWithCubitFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.errorMessage,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is ProductWithCubitSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "data fetched successfuly",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
