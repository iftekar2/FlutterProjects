import 'package:flutter/material.dart';
import 'package:shoping_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header: Logo
              //Use Container instead of DrawerHeader
              Container(
                height: 300,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.shopping_cart,
                  size: 80,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),
              // Shop tile
              MyListTile(
                icon: Icons.home,
                text: "Home",
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                icon: Icons.shopping_cart,
                text: "Cart",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: MyListTile(
              icon: Icons.exit_to_app,
              text: "Exit",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intro_page');
              },
            ),
          ),
          // Cart tile

          // Exit tile
        ],
      ),
    );
  }
}
