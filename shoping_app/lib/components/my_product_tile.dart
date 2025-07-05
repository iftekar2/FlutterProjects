import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/model/product.dart';
import 'package:shoping_app/model/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // Add Item to Cart
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("Add this item to cart?"),
            actions: [
              // Cancel adding item to cart
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              // Add item to the cart
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().addToCart(product);
                },

                child: Text("Add"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 185, 185, 185),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      padding: EdgeInsets.all(25),
      width: 300,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product Image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(25),
              child: Image.asset(product.image),
            ),
          ),

          SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name
              Text(
                product.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              // Product Description
              Text(product.description, style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Product Price
              Text(
                '\$' + product.price.toString(),
                style: TextStyle(fontSize: 20),
              ),

              // Add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                width: 70,
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
