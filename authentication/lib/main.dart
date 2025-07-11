import 'package:authentication/pages/email_signup_page.dart';
import 'package:authentication/pages/forgot_password.dart';
import 'package:authentication/pages/login_options_page.dart';
import 'package:authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
