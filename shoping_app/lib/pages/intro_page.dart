import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Message
              Text(
                "Welcome to Shopply",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10),
              Text(
                "The best shopping experience in the country!",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),

              // Apple Login
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.black, size: 30),
                      SizedBox(width: 20),
                      Text(
                        "Continue with Apple",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Google Login
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail, color: Colors.black, size: 30),
                      SizedBox(width: 20),
                      Text(
                        "Sign In with Gmail",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
              ),

              SizedBox(height: 20),
              // Continue Button
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/shop_page'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),

                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Or log in",
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1),
                    ),
                  ],
                ),
              ),

              // Continue
              Text.rich(
                TextSpan(
                  text: "Already have an account ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
