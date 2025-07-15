import 'package:auth_supa/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://xmnsfzsspmkeeseekmox.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhtbnNmenNzcG1rZWVzZWVrbW94Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIxMDA4MTksImV4cCI6MjA2NzY3NjgxOX0.YwdrPYO6UPTRFAKhbsAW3lKw6_mCOb5-TrfJdZPF9h436A",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
