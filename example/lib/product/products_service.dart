import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app/shopping_app.dart';

import 'product_dto.dart';

@immutable
class ProductsService implements IProductsService {

  @override
  Future<List<ProductDto>> getTastySnacks() {
    return Future.delayed(
        const Duration(milliseconds: 250),
        () => [
              {'productId': 1, 'name': 'Crispy Chips', 'price': 1.0},
              {'productId': 2, 'name': 'Chocolate Bar', 'price': 2.0},
              {'productId': 3, 'name': 'Donut', 'price': 4.25},
              {'productId': 4, 'name': 'Milk', 'price': 6.5},
              {'productId': 5, 'name': 'Corn Flakes', 'price': 12.3},
            ].map((product) => ProductDto.fromJson(product)).toList());
  }
}
