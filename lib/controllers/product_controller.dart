import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/models/product_model.dart';
import 'package:getx_example/services/product_service.dart';

class ProductController extends GetxController {
  List<ProductModel>? products;
  bool isLoading = false;
  String? erroMessage;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future<void> getAllProducts() async {
    isLoading = true;
    update();
    products = await ProductService().getAllProducts();
    if (products == null) {
      erroMessage = "failed to fetch data ...";

      // Get.snackbar("error", erroMessage!);
      
    }
    isLoading = false;
    update();
  }
}
