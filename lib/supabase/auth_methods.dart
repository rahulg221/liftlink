import 'dart:io';
import 'dart:typed_data';

import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitness_app/models/user.dart' as model;

class AuthMethods {
  final _supabase = Supabase.instance.client;

  Future<String> signInEmailAndPassword(String email, String password) async {
    try {
      final res = await _supabase.auth
          .signInWithPassword(email: email, password: password);

      if (res.user == null) {
        return 'Some error occured.';
      } else {
        return 'Signed in successfully.';
      }
    } on PostgrestException catch (e) {
      print('Exception caught: $e');
      return '[signInEmaiLAndPassword]: An unexpected error occurred: $e';
    }
  }

  Future<String> signUpEmailAndPassword(String email, String password,
      String username, String bio, Uint8List profilePic) async {
    try {
      // Attempt to sign up the user with Supabase
      final res = await _supabase.auth.signUp(email: email, password: password);

      // Check if the user object is null, indicating a failure to sign up
      if (res.user == null) {
        return 'Some error occurred when signing up.';
      } else {
        // Upload the profile picture to the storage bucket
        final photoUrl = await DbMethods().uploadProfilePic(profilePic);
        // Proceed to insert user details into the 'users' table
        await _supabase.from('users').upsert([
          {
            'id': res.user!.id,
            'username': username,
            'email': email,
            'bio': bio,
            'followingcount': 0,
            'followercount': 0,
            'streak': 0,
            'photoUrl': photoUrl,
          }
        ]);

        return 'Signed up successfully.';
      }
    } on PostgrestException catch (e) {
      print('Exception caught: $e');
      return '[signUpEmailAndPassword]: An unexpected error occurred: $e';
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    return;
  }

  Future<model.User> getUserDetails(String userId) async {
    try {
      final data =
          await _supabase.from('users').select().eq('id', userId).single();
      return model.User.fromJson(data);
    } on PostgrestException catch (e) {
      print('Exception caught: $e');
      // You can throw the exception or create a custom exception
      throw Exception('[getUserDetails]: An unexpected error occurred: $e');
    }
  }
}
