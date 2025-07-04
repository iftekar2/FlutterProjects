import 'package:flutter/material.dart';
import 'package:shoping_app/model/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Product Image
          Icon(Icons.favorite),

          // Product Name
          Text(product.name),

          // Product Description
          Text(product.description),

          // Product Price
          Text(product.price.toString()),

          // Add to cart button
        ],
      ),
    );
  }
}
