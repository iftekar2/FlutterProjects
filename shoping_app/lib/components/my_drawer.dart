import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer header: Logo
          Container(
            height: 300,
            alignment: Alignment.center,
            child: const Icon(
              Icons.shopping_cart,
              size: 80,
              color: Colors.black,
            ),
          ),

          // Shop tile

          // Cart tile

          // Exit tile
        ],
      ),
    );
  }
}
