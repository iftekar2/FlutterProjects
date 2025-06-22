import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),

          margin: EdgeInsets.symmetric(horizontal: 30),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Icon(Icons.search, color: Colors.white, size: 30),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            "everyone flies.. some fly longer than others",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Release",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),

              Text(
                "See all",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}
