import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      print("Starting Google Sign-In process...");

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      // Initialize Google Sign In
      print("Initializing GoogleSignIn...");
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Trigger the authentication flow
      print("Triggering Google Sign-In...");
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Hide loading indicator
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      if (googleUser == null) {
        print("User cancelled the sign-in");
        return;
      }

      print("Google user signed in: ${googleUser.email}");

      // Obtain the auth details from the request
      print("Getting authentication details...");
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print(
        "Access token: ${googleAuth.accessToken != null ? 'Present' : 'Missing'}",
      );
      print("ID token: ${googleAuth.idToken != null ? 'Present' : 'Missing'}");

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw 'Failed to get Google authentication tokens';
      }

      // Sign in to Supabase with Google credentials
      print("Signing in to Supabase...");
      final AuthResponse response = await Supabase.instance.client.auth
          .signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: googleAuth.idToken!,
            accessToken: googleAuth.accessToken!,
          );

      print(
        "Supabase response: ${response.user != null ? 'Success' : 'Failed'}",
      );

      if (response.user != null) {
        print("User successfully signed in: ${response.user!.email}");

        // Successfully signed in
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Welcome ${response.user!.userMetadata?['full_name'] ?? response.user!.email ?? 'User'}!',
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        throw 'Failed to sign in with Supabase';
      }
    } catch (error, stackTrace) {
      // Detailed error logging
      print("=== ERROR DETAILS ===");
      print("Error: $error");
      print("Error type: ${error.runtimeType}");
      print("Stack trace: $stackTrace");
      print("===================");

      // Hide loading indicator if still showing
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign in failed: $error'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5), // Show error longer
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
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
                shadowColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () => _signInWithGoogle(context),
              child: const Text(
                "Continue with Google",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
