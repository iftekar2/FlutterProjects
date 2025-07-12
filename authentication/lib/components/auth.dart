import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:authentication/components/database.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signinWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          'com.googleusercontent.apps.692669265108-0j6u3vm6q2au5nr7dcnn1cmth9hpssqa', // THIS ONE!
      scopes: <String>['email', 'profile'],
    );

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    UserCredential userCredential = await firebaseAuth.signInWithCredential(
      authCredential,
    );

    User? userDetail = userCredential.user;

    if (userCredential != null) {
      Map<String, dynamic> userData = {
        "email": userDetail!.email,
        "name": userDetail.displayName,
        "image": userDetail.photoURL,
        "id": userDetail.uid,
      };

      await Database().addUser(userDetail.uid, userData).then((value) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
  }
}
