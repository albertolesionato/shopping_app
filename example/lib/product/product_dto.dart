import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_app/shopping_app.dart';

part 'product_dto.g.dart';

@immutable
@JsonSerializable()
class ProductDto implements IProductDto {
  const ProductDto(
      {required this.productId, required this.name, required this.price});

  factory ProductDto.fromJson(StringMap json) => _$ProductDtoFromJson(json);

  @override
  @JsonKey(name: 'productId')
  final int productId;

  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  @JsonKey(name: 'price')
  final double price;

  StringMap toJson() => _$ProductDtoToJson(this);

  @override
  String toString() => toJson().toString();
}
