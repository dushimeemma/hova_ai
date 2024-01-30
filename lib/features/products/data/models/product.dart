import 'package:hova_ai/features/products/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    DateTime? createdAt,
    String? name,
    double? price,
    String? currencyCode,
    String? image,
    String? id,
  }) : super(
          createdAt: createdAt,
          name: name,
          price: price,
          currencyCode: currencyCode,
          image: image,
          id: id,
        );
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      name: json['name'],
      price: double.parse(json['price'] ?? ''),
      currencyCode: json['currencyCode'] ?? '',
      image: json['image'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
