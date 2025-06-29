import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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

              // Google Login

              // Manual Login

              // Register Page Link

              // Continue
            ],
          ),
        ),
      ),
    );
  }
}
