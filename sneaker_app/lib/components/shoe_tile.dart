import 'package:flutter/material.dart';
import 'package:sneaker_app/model/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;

  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 300,
      height: 400,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [
          // Shoe image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.image),
          ),
          // Shoe description

          // Shoe price

          // Add to bag button
        ],
      ),
    );
  }
}
