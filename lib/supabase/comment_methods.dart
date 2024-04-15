import 'dart:async';
import 'package:fitness_app/models/comments.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentMethods {
  final _supabase = Supabase.instance.client;

  Future<List<Comment>> getComments(
      int count, int startIndex, int postId) async {
    try {
      List<Map<String, dynamic>> comments = await _supabase.rpc('get_comments',
          params: {
            'comment_count': count,
            'start_index': startIndex,
            'post_id': postId
          });

      return comments.map((comment) => Comment.fromJson(comment)).toList();
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> uploadComment(String username, String uid, String content,
      String profilePicUrl, int postId) async {
    try {
      // Insert the comment details into the 'comments' table
      await _supabase.rpc('create_comment', params: {
        'user_id': uid,
        'post_id': postId,
        'username': username,
        'content': content,
        'profile_pic_url': profilePicUrl,
      });
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
