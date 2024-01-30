import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hova_ai/core/resources/data_state.dart';
import 'package:hova_ai/features/products/data/datasources/products_api_service.dart';
import 'package:hova_ai/features/products/data/models/product.dart';
import 'package:hova_ai/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsApiService _productsApiService;
  ProductRepositoryImpl(this._productsApiService);
  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    try {
      final httpResponse = await _productsApiService.getProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
