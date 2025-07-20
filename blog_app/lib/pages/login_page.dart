import 'package:blog_app/authentication/auth.dart';
import 'package:blog_app/components/signin_options_button.dart';
import 'package:blog_app/pages/email_signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void goToEmailLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmailSignupPage()),
    );
  }

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
              Image.asset(
                "lib/images/original-9b8466cce59081fe77f6a22be0f49d66.webp",
              ),

              SizedBox(height: 40),
              Text(
                "Welcome to our App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),
              Text(
                "Best Blog and news app in the world",
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),

              SizedBox(height: 20),
              Divider(color: Colors.grey[300], thickness: 1.5),

              SizedBox(height: 20),
              GestureDetector(
                child: SigninOptionsButton(
                  buttonText: "Continue with Apple",
                  buttonImage:
                      "lib/images/5b83693bae2828e7c357855f276520b0.jpg",
                  imageHeight: 35,
                  imageWidth: 35,
                  onPressed: () {},
                ),
              ),

              SizedBox(height: 20),
              SigninOptionsButton(
                buttonText: "Continue with Google",
                buttonImage:
                    "lib/images/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                imageHeight: 35,
                imageWidth: 35,
                onPressed: () {
                  AuthMethods().signInWithGoogle(context);
                },
              ),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[360], thickness: 1),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Or log in",
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(color: Colors.grey[360], thickness: 1),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: goToEmailLoginPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffedefef),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        color: const Color.fromARGB(
                          255,
                          128,
                          128,
                          128,
                        ).withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.email, size: 30, color: Colors.black),
                      SizedBox(width: 15),
                      Text(
                        "Continue with Email",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
              // Log in
              Text.rich(
                TextSpan(
                  text: "Already have an account ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
