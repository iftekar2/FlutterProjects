import 'package:flutter/material.dart';
import 'package:sneaker_app/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Go to the home page when the button is pressed
    void _goToHomePage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffeff0f0),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Positioned(
              top: 250,
              left: 120,
              child: Image.asset(
                'lib/image/nike-logo.png',
                height: 200,
                width: 200,
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Just Do It",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 85, 85, 85),
                          ),
                        ),

                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Brand new sneakers and custom kicks made with premium quality",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 162, 161, 161),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 30),
                        SizedBox(
                          height: 80,
                          width: 350,
                          child: ElevatedButton(
                            onPressed: _goToHomePage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              "Show Now",
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
