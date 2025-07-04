import 'package:flutter/material.dart';
import 'package:shoping_app/components/my_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Shop Page'),
      ),
      drawer: MyDrawer(),
    );
  }
}
