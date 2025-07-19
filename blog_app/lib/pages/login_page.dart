import 'package:blog_app/components/signin_options_button.dart';
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
      backgroundColor: Color(0xffedefef),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to our App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),
              Text(
                "Best Blog and news app in the world",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),

              SizedBox(height: 20),
              Divider(color: Colors.grey[300], thickness: 1.5),

              SizedBox(height: 20),
              SigninOptionsButton(
                buttonText: "Continue with Apple",
                buttonImage: "lib/images/Apple-Logosu.png",
                imageHeight: 35,
                imageWidth: 35,
                onPressed: () {},
              ),

              SizedBox(height: 20),
              SigninOptionsButton(
                buttonText: "Continue with Google",
                buttonImage:
                    "lib/images/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                imageHeight: 35,
                imageWidth: 35,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
