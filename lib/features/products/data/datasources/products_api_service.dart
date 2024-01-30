import 'package:dio/dio.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/features/products/data/models/product.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api_service.g.dart';

@RestApi(baseUrl: productsAPIBaseURL)
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio) = _ProductsApiService;
  @GET('/products')
  Future<HttpResponse<List<ProductModel>>> getProducts();
}
