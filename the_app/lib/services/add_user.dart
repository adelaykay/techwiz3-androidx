import 'package:flutter/foundation.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class AddUser {
  final String email;
  final String username;


  AddUser({required this.username, Key? key, required this.email});


  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = firestore.collection('sm_users');

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    users
        .add({'email': email, 'username': username, 'favorites': [], 'watchlist': [],})
        .then((value) => {
      if(kDebugMode) print('User Added')
    })
        .catchError((error) => {
      if(kDebugMode) print('Failed to add user: $error')
    });
  }
}
