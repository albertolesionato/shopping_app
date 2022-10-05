import 'package:flutter/foundation.dart';

@immutable
abstract class IProductDto {
  const IProductDto(this.productId, this.name, this.price);

  final int productId;
  final String name;
  final double price;
}
