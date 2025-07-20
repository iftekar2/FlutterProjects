import 'package:blog_app/pages/email_signup_page.dart';
import 'package:blog_app/pages/home_page.dart';
import 'package:blog_app/pages/login_page.dart';
import 'package:blog_app/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add the parentheses here
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      home: const WelcomePage(),
      routes: {
        '/welcome_page': (context) => const WelcomePage(),
        '/login_page': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/email_signup_page': (context) => const EmailSignupPage(),
      },
    );
  }
}
