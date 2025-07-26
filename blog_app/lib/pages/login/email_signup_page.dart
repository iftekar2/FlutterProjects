import 'package:blog_app/components/textfield_component.dart';
import 'package:blog_app/pages/home_page.dart';
import 'package:blog_app/pages/login/login_options_page.dart';
import 'package:blog_app/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmailSignupPage extends StatefulWidget {
  const EmailSignupPage({super.key});

  @override
  State<EmailSignupPage> createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends State<EmailSignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Changed to use controller text directly
  registration() async {
    // Only proceed if form is valid (this check is also done in onPressed)
    if (_formKey.currentState!.validate()) {
      // Use controller text directly for Firebase
      String emailText = emailController.text.trim(); // Trim whitespace
      String passwordText = passwordController.text;

      // Basic length check (already covered by validators but good fallback)
      if (passwordText.isNotEmpty &&
          emailText.isNotEmpty &&
          nameController.text.isNotEmpty) {
        try {
          // Changed to await for the SnackBar for better UX flow
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailText,
            password: passwordText,
          );
          // If successful, show snackbar and navigate
          await ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Registration Successful",
                style: TextStyle(fontSize: 20),
              ),
              backgroundColor: Colors.green, // Indicate success
            ),
          );
          if (mounted) {
            // Check if widget is still in tree before navigating
            Navigator.pushReplacement(
              // Use pushReplacement to prevent going back to signup
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        } on FirebaseAuthException catch (e) {
          String errorMessage;
          if (e.code == 'weak-password') {
            errorMessage = "Your password is too weak.";
          } else if (e.code == "email-already-in-use") {
            errorMessage = "An account with this email already exists.";
          } else if (e.code == "invalid-email") {
            errorMessage = "The email address is not valid.";
          } else {
            errorMessage = "An unknown error occurred: ${e.message}";
          }
          await ScaffoldMessenger.of(context).showSnackBar(
            // Await snackbar
            SnackBar(
              content: Text(errorMessage, style: const TextStyle(fontSize: 16)),
              backgroundColor: Colors.red, // Indicate error
            ),
          );
        } catch (e) {
          // Catch any other unexpected errors
          await ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "An unexpected error occurred: $e",
                style: const TextStyle(fontSize: 16),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // This block might be hit if the form.validate() somehow passes
        // but text fields are empty, or if this function is called directly
        // without form validation.
        await ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Please fill in all required fields.",
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffedefef),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginOptionsPage()),
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      backgroundColor: const Color(0xffedefef),
      body: SingleChildScrollView(
        // Add SingleChildScrollView for scrollability
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // You can keep Align or remove it if Column's crossAxisAlignment is start
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please enter log in details below",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                "Name",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextfieldComponent(
                textEditingController: nameController,
                hintText: "Enter full name",
                isPassword: false,
                validator: (value) {
                  // Add validator here
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              // Email Field
              const Text(
                "Email",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextfieldComponent(
                textEditingController: emailController,
                hintText: "Enter your email",
                isPassword: false,
                validator: (value) {
                  // Add email validator
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  // Basic email regex (can be more robust)
                  if (!RegExp(
                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              // Password Field
              const Text(
                "Password",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextfieldComponent(
                textEditingController: passwordController,
                hintText: "Enter password",
                isPassword: true,
                validator: (value) {
                  // Add password validator
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              // Confirm Password Field
              const Text(
                "Confirm Password",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextfieldComponent(
                textEditingController: confirmPasswordController,
                hintText: "Enter password",
                isPassword: true,
                validator: (value) {
                  // Add confirm password validator
                  if (value == null || value.isEmpty) {
                    return "Confirm password cannot be empty";
                  }
                  if (value != passwordController.text) {
                    // Check for match
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    // Validate the form
                    if (_formKey.currentState!.validate()) {
                      registration();
                    }
                  },
                  child: const Text(
                    "Sign Up",
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
    );
  }
}
