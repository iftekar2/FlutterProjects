import 'package:authentication/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignupPage extends StatefulWidget {
  EmailSignupPage({super.key});

  @override
  State<EmailSignupPage> createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends State<EmailSignupPage> {
  String fullName = "";
  String email = "";
  String password = "";

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registration() async {
    if (userNameController != null &&
        emailController != null &&
        passwordController != null &&
        confirmPasswordController != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Registration successful!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
        Navigator.pushReplacementNamed(context, '/home_page');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak_password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Password is too weak!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Email already in use",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[300]),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Page title
                Text(
                  "Create an account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 50),

                Column(
                  children: [
                    // Full name field
                    MyTextfield(
                      controller: userNameController,
                      hintText: "Full Name",
                      obscureText: false,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Full Name";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    // Email field
                    MyTextfield(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Email";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    // Password field
                    MyTextfield(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Password";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    // Confirm password field
                    MyTextfield(
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      obscureText: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm Password";
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                SizedBox(height: 80),
                // Create account button
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          fullName = userNameController.text;
                          email = emailController.text;
                          password = passwordController.text;
                        });
                      }
                      registration();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Create Account",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
