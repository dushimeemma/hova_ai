import 'package:hova_ai/core/resources/data_state.dart';
import 'package:hova_ai/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
