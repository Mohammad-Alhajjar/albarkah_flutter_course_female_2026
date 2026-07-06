import 'package:flutter/material.dart';
import 'package:rest_api_session_14/models/product_model.dart';
import 'package:rest_api_session_14/services/product_service.dart';

class ProductsPageWithButton extends StatefulWidget {
  const ProductsPageWithButton({super.key});

  @override
  State<ProductsPageWithButton> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPageWithButton> {
  List<ProductModel>? products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "fab1",
        onPressed: () async {
          products = await ProductService().getAllProducts();
          setState(() {});
        },
        child: Icon(Icons.get_app),
      ),
      body: products != null
          ? ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      products![index].image!,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.warning);
                      },
                    ),
                    title: Text(products![index].title!),
                    subtitle: Text(products![index].description!),
                    trailing: Text(products![index].price.toString()),
                  ),
                );
              },
            )
          : Center(child: Text("press button for fetching data ...")),
    );
  }
}
