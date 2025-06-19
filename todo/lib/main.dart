import 'package:flutter/material.dart';
import 'pages/counter_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MaterialApp(home: CounterPage()));
  }
}
