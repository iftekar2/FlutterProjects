import 'package:flutter/material.dart';
import 'package:shoping_app/model/product.dart';
import 'package:shoping_app/model/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  // Remove item from the cart
  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("Add this item to cart?"),
            actions: [
              // Cancel removing item from cart
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              // Add item to the cart
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().removeFromCart(product);
                },

                child: Text("Remove"),
              ),
            ],
          ),
    );
  }

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
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // Show items in the cart
                final item = cart[index];

                // Return the cart tile
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toString()),
                  trailing: IconButton(
                    onPressed: () => removeFromCart(context, item),
                    icon: Icon(Icons.delete),
                  ),
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
