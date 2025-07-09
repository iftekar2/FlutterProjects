import 'package:authentication/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void forgotPassword() {
      Navigator.pushNamed(context, "forgot_password_page");
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[300], toolbarHeight: 30),
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
            ),

            SizedBox(height: 20),
            MyTextfield(
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: forgotPassword,
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  // Handle login logic here
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
