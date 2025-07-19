import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addUser(String userId, Map<String, dynamic> userData) async {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userData);
  }
}
