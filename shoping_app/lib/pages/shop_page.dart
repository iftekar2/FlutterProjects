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
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: MyDrawer(),

      body: ListView(
        children: [
          SizedBox(height: 20),
          // Shop subtitle
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(fontSize: 16),
            ),
          ),

          // Shop list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
