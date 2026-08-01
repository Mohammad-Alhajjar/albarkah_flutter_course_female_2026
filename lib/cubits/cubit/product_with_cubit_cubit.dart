import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../services/product_service.dart';

part 'product_with_cubit_state.dart';

class ProductWithCubitCubit extends Cubit<ProductWithCubitState> {
  ProductWithCubitCubit() : super(ProductWithCubitInitial());

  Future<void> getAllProducts() async {
    emit(ProductWithCubitLoading());
    List<ProductModel>? productModels = await ProductService().getAllProducts();
    if (productModels != null) {
      emit(ProductWithCubitSuccess(products: productModels));
    } else {
      emit(
        ProductWithCubitFailure(
          errorMessage:
              "failed to fecth data from server ... check your connection and try again",
        ),
      );
    }
  }
}
