import 'package:flutter/material.dart';
import 'package:rest_api_session_14/services/product_service.dart';

class OneProductPage extends StatelessWidget {
  const OneProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ProductService().getOneProduct(productId: 10),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListTile(
                leading: Image.network(
                  snapshot.data!.image!,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.warning);
                  },
                ),
                title: Text(snapshot.data!.title!),
                subtitle: Text(snapshot.data!.description!),
                trailing: Text(snapshot.data!.price.toString()),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LinearProgressIndicator());
          } else {
            return Center(child: Text("failed to fetch data ..."));
          }
        },
      ),
    );
  }
}
