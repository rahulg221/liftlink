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
          await _supabase.rpc('get_user_details', params: {'uid': uid});

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
      await _supabase.rpc('upload_post', params: {
        'username': username,
        'uid': uid,
        'profile_pic': profilePicUrl,
        'streak': streak,
        'post_pic': postPicUrl,
        'caption': caption
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
    } catch (e) {
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

  Future<List<dynamic>> searchUsers(String username) async {
    try {
      // Search for users with usernames that match the query
      final data = await _supabase
          .rpc('search_users', params: {'username_pattern': username});

      return data;
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  // Check if the current user follows the user, returns true if so
  Future<bool> doesFollowUser(String uid, String followedId) async {
    try {
      // Check if the current user follows the user
      final res = await _supabase.rpc('does_follow_user',
          params: {'uid': uid, 'other_id': followedId});

      return res;
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> followUser(String followedId, String uid) async {
    try {
      // Insert the follower details into the 'followers' table
      await _supabase.from('follows').insert([
        {
          'follower_id': uid,
          'followed_id': followedId,
        }
      ]);

      // Get the current following count
      var res = await _supabase.from('users').select().eq('id', uid).single();

      // Increment the following count
      int followingCount = res['followingcount'];
      followingCount++;

      // Update the current user info with the new follower count
      await _supabase
          .from('users')
          .update({'followingcount': followingCount}).eq('id', uid);

      res =
          await _supabase.from('users').select().eq('id', followedId).single();

      // Get the current follower count
      int followerCount = res['followercount'];
      followerCount++;

      // Update the followed user info with the new follower count
      await _supabase
          .from('users')
          .update({'followercount': followerCount}).eq('id', followedId);
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> unfollowUser(String followedId, String uid) async {
    try {
      // Delete the follower details from the 'followers' table
      await _supabase
          .from('follows')
          .delete()
          .match({'follower_id': uid, 'followed_id': followedId});

      // Decrement the following count for the follower
      var res = await _supabase
          .from('users')
          .select('followingcount')
          .eq('id', uid)
          .single();

      if (res['followingcount'] != null) {
        int followingCount = res['followingcount'];
        if (followingCount > 0) {
          // Ensure the count doesn't go negative
          followingCount--;

          await _supabase
              .from('users')
              .update({'followingcount': followingCount}).eq('id', uid);
        }
      }

      // Decrement the follower count for the user being unfollowed
      res = await _supabase
          .from('users')
          .select('followercount')
          .eq('id', followedId)
          .single();

      if (res['followercount'] != null) {
        int followerCount = res['followercount'];
        if (followerCount > 0) {
          // Ensure the count doesn't go negative
          followerCount--;

          await _supabase
              .from('users')
              .update({'followercount': followerCount}).eq('id', followedId);
        }
      }
    } on PostgrestException catch (e) {
      // Handle exceptions or errors
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
