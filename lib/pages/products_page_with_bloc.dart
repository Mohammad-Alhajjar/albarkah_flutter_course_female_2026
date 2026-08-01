import 'package:bloc_example/blocs/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPageWithBloc extends StatefulWidget {
  const ProductsPageWithBloc({super.key});

  @override
  State<ProductsPageWithBloc> createState() => _ProductsPageWithBlocState();
}

class _ProductsPageWithBlocState extends State<ProductsPageWithBloc> {
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

            // ! body using only consumer
            body: Center(
              child: BlocConsumer<ProductBloc, ProductState>(
                builder: (BuildContext context, ProductState state) {
                  if (state is ProductLoading || state is ProductInitial) {
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
                listener: (BuildContext context, ProductState state) {
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
              ),
            ),

            // ! Body using builder and listener
            // body: BlocListener<ProductBloc, ProductState>(
            //   listener: (context, state) {
            //     if (state is ProductFailure) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(
            //             state.errorMessage,
            //             style: TextStyle(color: Colors.white),
            //           ),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //     } else if (state is ProductSuccess) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(
            //             "data fetched successfuly",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //           backgroundColor: Colors.green,
            //         ),
            //       );
            //     }
            //   },
            //   child: Center(
            //     child: BlocBuilder<ProductBloc, ProductState>(
            //       builder: (context, state) {
            //         if (state is ProductLoading) {
            //           return CircularProgressIndicator();
            //         } else if (state is ProductFailure) {
            //           return Icon(Icons.warning, size: 150, color: Colors.red);
            //         } else if (state is ProductSuccess) {
            //           return ListView.builder(
            //             itemBuilder: (context, index) {
            //               return Card(
            //                 child: ListTile(
            //                   leading: Image.network(
            //                     state.products[index].image!,
            //                   ),
            //                   title: Text(state.products[index].title),
            //                   subtitle: Text(
            //                     state.products[index].description ??
            //                         "no description",
            //                   ),
            //                   trailing: Text(
            //                     state.products[index].price.toString(),
            //                   ),
            //                 ),
            //               );
            //             },
            //           );
            //         }
            //         return SizedBox.shrink();
            //       },
            //     ),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
