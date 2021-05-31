import 'package:cloud_firestore/cloud_firestore.dart';

class FireStroeQuery {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  /* 
  * Add new users
  */
  Future<void> addNewUsers(Map userData) async {
    CollectionReference users = _firestore.collection('users');
    return users.doc(userData['email']).set(userData);
  }
}
