import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hova_ai/features/products/domain/entities/product.dart';

abstract class ProductState extends Equatable {
  final List<ProductEntity>? products;
  final DioException? error;

  const ProductState({
    this.products,
    this.error,
  });

  @override
  List<Object?> get props => [
        products!,
        error!,
      ];
}

class ProductsLoadingState extends ProductState {
  const ProductsLoadingState();
}

class ProductsDone extends ProductState {
  const ProductsDone(List<ProductEntity> product) : super(products: product);
}

class ProductsError extends ProductState {
  const ProductsError(DioException error) : super(error: error);
}
