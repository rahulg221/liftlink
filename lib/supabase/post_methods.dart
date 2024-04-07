import 'dart:async';
import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/supabase/storage_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostMethods {
  final _supabase = Supabase.instance.client;

  Future<void> uploadPost(Uint8List postPic, String username, String uid,
      String profilePicUrl, int streak, String caption) async {
    try {
      // Upload the post picture to the storage bucket
      final postPicUrl = await StorageMethods().uploadPostPic(postPic, uid);

      // Insert the post details into the 'posts' table
      await _supabase.rpc('upload_post', params: {
        'username': username,
        'uid': uid,
        'profile_pic': profilePicUrl,
        'streak': streak,
        'post_pic': postPicUrl,
        'caption': caption,
        'comment_count': 0,
        'like_count': 0,
      });
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
      List<Map<String, dynamic>> posts = await _supabase.rpc(
          'get_explore_posts',
          params: {'post_count': count, 'start_index': startIndex});

      return posts.map((post) => Post.fromJson(post)).toList();
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<Post>> getFollowingPosts(
      int count, int startIndex, String uid) async {
    try {
      List<Map<String, dynamic>> posts = await _supabase
          .rpc('get_following_posts', params: {
        'post_count': count,
        'start_index': startIndex,
        'current_user_id': uid
      });

      return posts.map((post) => Post.fromJson(post)).toList();
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
