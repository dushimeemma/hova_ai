import 'package:hova_ai/core/resources/data_state.dart';
import 'package:hova_ai/core/usecases/usecase.dart';
import 'package:hova_ai/features/products/domain/entities/product.dart';
import 'package:hova_ai/features/products/domain/repositories/product_repository.dart';

class GetProductUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final ProductRepository _productRepository;
  GetProductUseCase(this._productRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProducts();
  }
}
