import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/product_controller.dart';

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
    ProductController productController = Get.put<ProductController>(
      ProductController(),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Products Page")),
      body: Center(
        child: GetBuilder(
          init: productController,
          builder: (controller) {
            if (controller.isLoading) {
              return CircularProgressIndicator();
            } else if (controller.erroMessage != null && controller.products == null) {
              return Text(controller.erroMessage!);
            }else{
             return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(controller.products![index].image!),
                      title: Text(controller.products![index].title),
                      subtitle: Text(
                        controller.products![index].description ?? "no description",
                      ),
                      trailing: Text(controller.products![index].price.toString()),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
