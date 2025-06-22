import 'package:flutter/material.dart';
import 'package:sneaker_app/components/bottom_nav.dart';
import 'package:sneaker_app/pages/bag_page.dart';
import 'package:sneaker_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  void navigatorButtomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const BagPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigatorButtomBar(index),
      ),

      body: _pages[_currentIndex],
    );
  }
}
