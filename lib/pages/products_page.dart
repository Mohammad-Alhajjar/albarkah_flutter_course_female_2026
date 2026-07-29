import 'package:bloc_example/blocs/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc()
            ..add(GetProducts(test: "testing passing data from ui to bloc")),
      // create: (context) => ProductBloc(),
      child: Builder(
        builder: (context) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   context.read<ProductBloc>().add(GetProducts());
          // });

          return Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     context.read<ProductBloc>().add(GetProducts());
            //   },
            // ),
            appBar: AppBar(title: Text("Products Page")),
            body: BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ProductFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is ProductSuccess) {
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
              child: Center(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return CircularProgressIndicator();
                    } else if (state is ProductFailure) {
                      return Icon(Icons.warning, size: 150, color: Colors.red);
                    } else if (state is ProductSuccess) {
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
