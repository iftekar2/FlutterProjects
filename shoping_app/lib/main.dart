import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/model/shop.dart';
import 'package:shoping_app/pages/cart_page.dart';
import 'package:shoping_app/pages/intro_page.dart';
import 'package:shoping_app/pages/shop_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}
