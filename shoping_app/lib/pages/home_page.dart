import 'package:flutter/material.dart';
import 'package:shoping_app/components/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 30),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, size: 30),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(), // Using the extracted AppDrawer widget
      body: const Center(child: Text('Welcome to the Shopping App!')),
    );
  }
}
