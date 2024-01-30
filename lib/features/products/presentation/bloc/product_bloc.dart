import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hova_ai/core/resources/data_state.dart';
import 'package:hova_ai/features/products/domain/usecases/get_product.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_event.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductState> {
  final GetProductUseCase _getProductUseCase;
  ProductsBloc(this._getProductUseCase) : super(const ProductsLoadingState()) {
    on<GetProducts>(onGetProducts);
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    final dataState = await _getProductUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProductsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(ProductsError(dataState.error!));
    }
  }
}
