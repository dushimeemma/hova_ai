import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hova_ai/features/products/data/datasources/products_api_service.dart';
import 'package:hova_ai/features/products/data/repositories/product_repository_impl.dart';
import 'package:hova_ai/features/products/domain/repositories/product_repository.dart';
import 'package:hova_ai/features/products/domain/usecases/get_product.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ProductsApiService>(ProductsApiService(sl()));
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));
  sl.registerSingleton<GetProductUseCase>(GetProductUseCase(sl()));
  sl.registerFactory(() => ProductsBloc(sl()));
}
