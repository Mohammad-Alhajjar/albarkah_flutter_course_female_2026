// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pagination_example/models/product_model.dart';

class ProductPaginationState {
  final List<ProductModel> products;
  final bool isLoading;
  final String? errorMessage;
  final int skip;
  final bool hasMore;

  ProductPaginationState({
    required this.products,
    this.isLoading = false,
    this.errorMessage,
    this.skip = 0,
     this.hasMore = true,
  });

  ProductPaginationState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? errorMessage,
    int? skip,
    bool? hasMore,
  }) {
    return ProductPaginationState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      skip: skip ?? this.skip,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
