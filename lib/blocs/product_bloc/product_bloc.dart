import 'package:bloc_example/models/product_model.dart';
import 'package:bloc_example/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProducts>((event, emit) async {
      print(event.test);
      emit(ProductLoading());

      List<ProductModel>? productModels = await ProductService()
          .getAllProducts();

      if (productModels != null) {
        emit(ProductSuccess(products: productModels));
      } else {
        emit(
          ProductFailure(
            errorMessage:
                "failed to fecth data from server ... check your connection and try again",
          ),
        );
      }
    });
  }
}
