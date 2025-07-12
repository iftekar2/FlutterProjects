import 'package:authentication/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, '/home_page');
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'User does not exist!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect password', style: TextStyle(fontSize: 20)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void forgotPassword() {
      Navigator.pushNamed(context, "/forgot_password_page");
    }

    void navigateToLoginOptions() {
      Navigator.pushNamed(context, "/login_options_page");
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: navigateToLoginOptions,
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
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

              SizedBox(height: 20),
              MyTextfield(
                hintText: "Password",
                controller: passwordController,
                obscureText: true,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Password";
                  }
                  return null;
                },
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    }
                    userLogin();
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
      ),
    );
  }
}
