import 'package:blog_app/pages/login/email_signup_page.dart';
import 'package:blog_app/pages/home_page.dart';
import 'package:blog_app/pages/login/login_options_page.dart';
import 'package:blog_app/pages/login/login_page.dart';
import 'package:blog_app/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // This is for initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // This if for initializing Supabase
  await Supabase.initialize(
    url: 'https://xmnsfzsspmkeeseekmox.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhtbnNmenNzcG1rZWVzZWVrbW94Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIxMDA4MTksImV4cCI6MjA2NzY3NjgxOX0.YwdrPYO6UPTRFAKhbsAW3lKw6_mCOb5-TrfJdZPF9h4',
  );

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
        '/login_options_page': (context) => const LoginOptionsPage(),
        '/home_page': (context) => const HomePage(),
        '/email_signup_page': (context) => const EmailSignupPage(),
        '/login_page': (context) => const LoginPage(),
      },
    );
  }
}
