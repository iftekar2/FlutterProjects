import 'package:flutter/material.dart';
import 'package:shoping_app/model/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get access to the cart
    final cart = context.watch<Shop>().getCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cart Page"),
      ),

      body: Column(
        children: [
          // Items in the cart
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                // Show items in the cart
                final item = cart[index];

                // Return the cart tile
                return ListTile(
                  title: Text(item.name),
                  trailing: Text(item.price.toString()),
                  trailing: 
                );
              },
            ),
          ),

          // Pay
        ],
      ),
    );
  }
}
