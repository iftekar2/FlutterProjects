import 'package:flutter/material.dart';
import 'package:sneaker_app/model/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;

  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 300,
        //padding: EdgeInsets.all(20),
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                shoe.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            // Shoe price

            // Add to bag button
          ],
        ),
      ),
    );
  }
}
