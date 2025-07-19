import 'package:blog_app/authentication/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result != null) {
      Map<String, dynamic> userData = {
        "email": userDetails!.email,
        "name": userDetails.displayName,
        "imageUrl": userDetails.photoURL,
        "id": userDetails.uid,
      };
      await DataBaseMethods().addUser(userDetails.uid, userData).then((value) {
        Navigator.pushReplacementNamed(context, "/home_page");
      });
    }
  }
}
