import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome message
            Text(
              "Welcome to Cookly",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),

            SizedBox(height: 20),
            // Slogan
            Text(
              "The best cooking and food recipes app of the country.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),
            // Apple login button
            SizedBox(
              height: 60,
              width: 500,
              child: ElevatedButton(
                // This is to style the button
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  elevation: 0,
                  // This is to remove the ripple effect when button is pressed
                  shadowColor: Colors.transparent,
                  splashFactory:
                      NoSplash.splashFactory, // Removes ripple effect
                ),
                onPressed: () {},

                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image(
                          image: const AssetImage("lib/images/apple-logo.png"),
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // Google login button

            // Other signup options text

            // Sign up with email button

            // Log in
          ],
        ),
      ),
    );
  }
}
