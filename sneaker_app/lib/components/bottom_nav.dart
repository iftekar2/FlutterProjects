import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  final void Function(int)? onTabChange;

  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: SizedBox(
          child: GNav(
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
                iconColor: Colors.black,
                iconActiveColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.black,
                iconSize: 24,
                gap: 10,
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: "Bag",
                iconColor: Colors.black,
                iconActiveColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.black,
                iconSize: 24,
                gap: 10,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            onTabChange: (value) => onTabChange!(value),
          ),
        ),
      ),
    );
  }
}
