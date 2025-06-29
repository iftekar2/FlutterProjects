import 'package:flutter/material.dart';
import 'package:shoping_app/pages/home_page.dart';
import 'package:shoping_app/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: IntroPage(homePage: const HomePage()),
    );
  }
}
