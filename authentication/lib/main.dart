import 'package:authentication/pages/email_signup_page.dart';
import 'package:authentication/pages/login_options_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOptionsPage(),
      routes: {
        '/login_options_page': (context) => const LoginOptionsPage(),
        '/email_signup_page': (context) => const EmailSignupPage(),
      },
    );
  }
}
