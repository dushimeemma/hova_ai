import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final DateTime createdAt;
  final String name;
  final double price;
  final String currencyCode;
  final String image;
  final String id;

  const ProductEntity({
    required this.createdAt,
    required this.name,
    required this.price,
    required this.currencyCode,
    required this.image,
    required this.id,
  });

  @override
  List<Object?> get props {
    return [
      createdAt,
      name,
      price,
      currencyCode,
      image,
      id,
    ];
  }
}
