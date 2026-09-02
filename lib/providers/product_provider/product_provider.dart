import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_example/datasources/product_remote_datasource.dart';
import 'package:pagination_example/providers/product_provider/product_pagination_state.dart';
import 'package:pagination_example/repositories/product_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final productRemoteDatasource = Provider<ProductRemoteDatasource>((ref) {
  final dio = ref.read(dioProvider);
  return ProductRemoteDatasource(dio: dio);
});

final productRepository = Provider<ProductRepository>((ref) {
  final remoteDatasource = ref.read(productRemoteDatasource);

  return ProductRepository(remoteDatasource: remoteDatasource);
});

final productsAsyncProvider =
    AsyncNotifierProvider<ProductPaginationProvider, ProductPaginationState>(
      () {
        return ProductPaginationProvider();
      },
    );

class ProductPaginationProvider extends AsyncNotifier<ProductPaginationState> {
  static final int _limit = 20;

  @override
  Future<ProductPaginationState> build() async {
    final result = await ref
        .read(productRepository)
        .getProductsPagination(limit: _limit, skip: 0);

    if (result == null) {
      throw Exception("faild to fetch data, check your internet ...");
    }
    // return ProductPaginationState(products: result, skip: 0);
    return ProductPaginationState(products: result);
  }

  Future<void> getProdcutsNextPage() async {
    final currentState = state.value;

    if (currentState == null ||
        currentState.isLoading ||
        !currentState.hasMore) {
      return;
    }
    int nextSkip = currentState.skip + _limit;
    state = AsyncData(currentState.copyWith(isLoading: true));
    final result = await ref
        .read(productRepository)
        .getProductsPagination(limit: _limit, skip: nextSkip);
    print(nextSkip);

    if (result == null) {
      state = AsyncData(
        currentState.copyWith(
          isLoading: false,
          errorMessage:
              "failed to fetch next page of items and stopped with skip: $nextSkip",
        ),
      );
      return;
    }

    if (result.isEmpty) {
      state = AsyncData(
        currentState.copyWith(
          hasMore: false,
          isLoading: false,
          errorMessage: null,
        ),
      );
      return;
    }

    state = AsyncData(
      currentState.copyWith(
        products: [...currentState.products, ...result],
        isLoading: false,
        errorMessage: null,
        skip: nextSkip,
      ),
    );
  }
}
