import 'package:flutter/material.dart';
import 'package:shoping_app/components/app_drawer.dart';

class ShopPage extends StatelessWidget {
  //   final List<Widget> _pages = [const ShopPage()];

  // int _currentIndex = 0;
  // void navigation(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Page')),
      drawer: AppDrawer(),
    );

    // body: _pages[_currentIndex],
  }
}
