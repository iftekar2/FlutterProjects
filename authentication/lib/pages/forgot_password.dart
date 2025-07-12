import 'package:authentication/components/my_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void goToLoginPage() {
      Navigator.pushNamed(context, '/login_page');
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[300]),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextfield(
              hintText: "Email",
              controller: emailController,
              obscureText: false,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter Email";
                }
                return null;
              },
            ),

            SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: 500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: goToLoginPage,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
