import 'package:cloud_firestore/cloud_firestore.dart';

class FireStroeQuery {
  /* 
  * Add new users
  */
  void addNewUsers(Map userData) {
    // Add new document to users collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .add({
          'uid': userData['uid'],
          'firstname': userData['firstname'],
          'lastname': userData['lastname'],
          'dob': userData['dob'],
          'phone': userData['phone'],
          'address': userData['address'],
        })
        .then((value) => print("User Added $value"))
        .catchError(
          (error) => print("Failed to add users: $error"),
        );
    print(users);
  }
}
