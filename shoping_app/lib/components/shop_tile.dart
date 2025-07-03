import 'package:flutter/material.dart';
import 'package:shoping_app/model/product.dart';

class Shop extends StatelessWidget {
  final Product product;

  const Shop({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Product image
          Icon(Icons.home),

          // Product name
          Text(product.name),

          // Product description
          Text(product.description),
          // Product price
          Text(product.price.toString()),

          // Add to cart button
        ],
      ),
    );
  }
}
