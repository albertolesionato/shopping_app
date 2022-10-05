import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/future_widget.dart';

import '../products/i_products_service.dart';
import '../cart/cart.dart';
import '../categories/categories.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  var selectedTab = 'home';

  @override
  Widget build(BuildContext context) {
    tab(IconData iconData, String label) {
      final color = Theme.of(context).scaffoldBackgroundColor;
      final value = label.toLowerCase();

      return SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Material(
          color: selectedTab == value ? color : Colors.white,
          child: InkWell(
            hoverColor: color,
            onTap: () {
              setState(() {
                selectedTab = value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Icon(iconData),
                  const SizedBox(height: 5),
                  Text(label)
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: () {
          switch (selectedTab) {
            case 'home':
              return 0;
            case 'cart':
              return 1;
            case 'categories':
              return 2;
          }
        }(),
        children: [
          FutureWidget.part(future: () async {
            final data = await context.read<IProductsService>().getTastySnacks();
            print(data);

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(child: Text('#$index ${data[index].name}'));
                });
          }),
          const Cart(),
          const Categories()
        ],
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tab(Icons.home_filled, 'Home'),
                tab(Icons.shopping_cart, 'Cart'),
                tab(Icons.category, 'Categories')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
