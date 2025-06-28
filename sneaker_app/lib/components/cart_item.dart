import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/model/cart.dart';
import 'package:sneaker_app/model/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Remove from Cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeShoeFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.image, fit: BoxFit.cover),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
