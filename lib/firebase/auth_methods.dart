import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/firebase/storage_methods.dart';
import 'package:fitness_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up user
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required Uint8List profilePicture,
  }) async {
    String res = 'error';

    // Check if any field is empty
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      res = 'Please fill in every field.';
      return res;
    }

    try {
      // Create new user
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Upload image to store
      String photoUrl = await StorageMethods()
          .uploadImageToStorage(profilePicture, 'profilePics', false);

      // Create instance of user model and fill in info
      model.User user = model.User(
        username: username,
        uid: cred.user!.uid,
        email: email,
        photoUrl: photoUrl,
      );

      // Add user to database
      await _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJson());

      res = 'success';
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'Please enter a valid email address.';
      } else if (err.code == 'weak-password') {
        res = 'Password should be at least 6 characters long.';
      }
    }

    return res;
  }
}
