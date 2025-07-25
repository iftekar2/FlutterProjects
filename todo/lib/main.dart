import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //Initialize Hive
  await Hive.initFlutter();
  //Open a box
  var box = await Hive.openBox('todo_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CounterPage());
  }
}
