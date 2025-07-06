import 'package:flutter/material.dart';

class LoginOptionsPage extends StatelessWidget {
  const LoginOptionsPage({super.key});

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

            SizedBox(height: 20),
            // Google login button
            SizedBox(
              height: 60,
              width: 500,
              child: ElevatedButton(
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
                          image: const AssetImage("lib/images/google-logo.png"),
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
            // Other signup options text
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
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(color: Colors.grey[360], thickness: 1),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Sign up with email button
            SizedBox(
              height: 60,
              width: 500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  // This is to remove the ripple effect when button is pressed
                  shadowColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed:
                    () => Navigator.pushNamed(context, "/email_signup_page"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined, size: 30, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Sign up with Email",
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
    );
  }
}
