import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/shopping_app.dart';

import 'product/products_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: MultiProvider(
          providers: [
            Provider<IProductsService>(create: (context) => ProductsService()),
          ],
          child: const ShoppingApp(),
        ));
  }
}
