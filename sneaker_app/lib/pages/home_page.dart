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
  void navigatorBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const BagPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff0f0),
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigatorBottomBar(index),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Builder(
            builder:
                (context) => IconButton(
                  icon: Icon(Icons.menu, size: 30, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
          ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Color(0xffeff0f0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Image.asset(
                    "lib/image/nike-logo.png",
                    height: 100,
                    width: 100,
                  ),
                ),

                const ListTile(
                  leading: Icon(Icons.home, size: 30, color: Colors.black),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                const ListTile(
                  leading: Icon(Icons.info, size: 30, color: Colors.black),
                  title: Text(
                    "Info",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 30),
              child: ListTile(
                leading: Icon(Icons.logout, size: 30, color: Colors.black),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: _pages[_currentIndex],
    );
  }
}
