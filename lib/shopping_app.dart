import 'package:flutter/material.dart';

import 'home/home.dart';
import 'products/product.dart';

export 'products/i_product_dto.dart';
export 'products/i_products_service.dart';

typedef StringMap = Map<String, dynamic>;

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => const Home(),
        Product.routeName: (context) => const Product()
      },
      onGenerateRoute: (settings) {},
    );
  }
}
