import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final DateTime? createdAt;
  final String? name;
  final double? price;
  final String? currencyCode;
  final String? image;
  final String? id;
  final int? quantity;

  const ProductEntity({
    this.createdAt,
    this.name,
    this.price,
    this.currencyCode,
    this.image,
    this.id,
    this.quantity,
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
      quantity,
    ];
  }
}
