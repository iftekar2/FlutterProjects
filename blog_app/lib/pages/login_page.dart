import 'package:blog_app/pages/forgot_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffedefef),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login_options_page');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color(0xffedefef),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 120),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Log in",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Please enter login details below",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20),
            Text("Email", style: TextStyle(fontSize: 20)),

            SizedBox(height: 10),
            TextFormField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),

                hint: Text(
                  "Enter your email",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text("Email", style: TextStyle(fontSize: 20)),

            SizedBox(height: 10),
            TextFormField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),

                hint: Text(
                  "Enter your password",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ),
            ),

            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text.rich(
                TextSpan(
                  text: "Forget Password?",
                  style: TextStyle(fontSize: 18),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                ),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
