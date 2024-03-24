import 'dart:async';
import 'package:fitness_app/models/post.dart';
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

  Future<void> uploadPost(Uint8List postPic, String username, String uid,
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
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<Post>> getExplorePosts(int count, int startIndex) async {
    try {
      List<Map<String, dynamic>> posts = await _supabase
          .from('posts')
          .select()
          .order('created_at', ascending: false)
          .range(startIndex, startIndex + count - 1)
          .limit(count);

      return posts.map((post) => Post.fromJson(post)).toList();
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<dynamic>> searchUsers(String username) async {
    try {
      // Search for users with usernames that match the query
      final data = await _supabase
          .from('users')
          .select()
          .ilike('username', '%$username%')
          .limit(10);

      return data;
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
