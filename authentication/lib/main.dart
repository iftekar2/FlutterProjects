import 'package:authentication/pages/email_signup_page.dart';
import 'package:authentication/pages/forgot_password.dart';
import 'package:authentication/pages/login_options_page.dart';
import 'package:authentication/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: LoginOptionsPage(),
      routes: {
        '/login_options_page': (context) => const LoginOptionsPage(),
        '/email_signup_page': (context) => EmailSignupPage(),
        '/login_page': (context) => LoginPage(),
        '/forgot_password_page': (context) => ForgotPassword(),
      },
    );
  }
}
