import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/components/my_drawer.dart';
import 'package:shoping_app/components/my_product_tile.dart';
import 'package:shoping_app/model/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().getProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Shop Page'),
      ),
      drawer: MyDrawer(),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return MyProductTile(product: product);
        },
      ),
    );
  }
}
