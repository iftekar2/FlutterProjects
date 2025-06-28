import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/components/cart_item.dart';
import 'package:sneaker_app/model/cart.dart';
import 'package:sneaker_app/model/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(
                  "My Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getShoesForSaleInCart().length,
                    itemBuilder: (context, index) {
                      // Get individual shoe
                      Shoe individualShoe =
                          value.getShoesForSaleInCart()[index];

                      // Return the Cart item
                      return CartItem(shoe: individualShoe);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
