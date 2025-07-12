import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String userId, Map<String, dynamic> userInfo) async {
    return await _firestore.collection("User").doc(userId).set(userInfo);
  }
}
