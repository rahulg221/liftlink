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
            'pid': postId
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

  Future<void> uploadComment(String username, String uid, String comment,
      String profilePicUrl, int postId) async {
    try {
      // Insert the post details into the 'posts' table
      await _supabase.rpc('upload_comment', params: {
        'username': username,
        'uid': uid,
        'profile_pic': profilePicUrl,
        'comment': comment,
        'post_id': postId,
      });

      await _supabase.rpc('increment_comment_count', params: {'pid': postId});
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
