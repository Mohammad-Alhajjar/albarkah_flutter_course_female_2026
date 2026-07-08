import 'package:flutter/material.dart';
import 'package:rest_api_session_14/models/product_model.dart';
import 'package:rest_api_session_14/services/product_service.dart';
import 'package:rest_api_session_14/view/one_product_page.dart';

class ProductsPageWithFutureBuilder extends StatefulWidget {
  const ProductsPageWithFutureBuilder({super.key});

  @override
  State<ProductsPageWithFutureBuilder> createState() =>
      _ProductsPageWithFutureBuilderState();
}

class _ProductsPageWithFutureBuilderState
    extends State<ProductsPageWithFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool isProductCreated = await ProductService().create(
            newItem: ProductModel(
              title: "title",
              description: "description",
              image: "image.net",
              price: 100,
            ),
          );
          if (isProductCreated) {
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("failed to create new data, try again later..."),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("products Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OneProductPage()),
              );
            },
            icon: Icon(Icons.arrow_forward_sharp),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ProductService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                // print(snapshot.data);
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      products[index].image!,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.warning);
                      },
                    ),
                    title: Text(products[index].title!),
                    subtitle: Text(products[index].description!),
                    trailing: Text(products[index].price.toString()),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text("failed to fetch data, try again later..."),
            );
          }
        },
      ),
    );
  }
}
