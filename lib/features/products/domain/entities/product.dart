import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final DateTime? createdAt;
  final String? name;
  final double? price;
  final String? currencyCode;
  final String? image;
  final String? id;

  const ProductEntity({
    this.createdAt,
    this.name,
    this.price,
    this.currencyCode,
    this.image,
    this.id,
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
