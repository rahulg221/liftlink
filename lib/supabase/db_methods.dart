import 'dart:async';
import 'package:fitness_app/models/user.dart' as model;
import 'package:fitness_app/supabase/storage_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbMethods {
  final _supabase = Supabase.instance.client;

  Future<model.User> getUserDetails(String uid) async {
    try {
      // Retrieve user details from the 'users' table
      final data =
          await _supabase.from('users').select().eq('id', uid).single();

      return model.User.fromJson(data);
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<String> uploadPost(Uint8List postPic, String username, String uid,
      String profilePicUrl, int streak, String caption) async {
    try {
      // Upload the post picture to the storage bucket
      final postPicUrl = await StorageMethods().uploadPostPic(postPic, uid);

      // Insert the post details into the 'posts' table
      await _supabase.from('posts').insert([
        {
          'uid': uid,
          'username': username,
          'streak': 0,
          'profile_pic': profilePicUrl,
          'post_pic': postPicUrl,
          'caption': caption,
        }
      ]);

      return 'success';
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'postgrest-exception';
    }
  }
}
