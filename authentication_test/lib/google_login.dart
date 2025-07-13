import 'package:authentication_test/services/auth.dart';
import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                AuthMethod().signInWithGoogle(context);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.login, color: Colors.white),
              ),
            ),

            Text("data"),
          ],
        ),
      ),
    );
  }
}
