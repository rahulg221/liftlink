import 'dart:async';
import 'package:fitness_app/models/user.dart' as model;
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserMethods {
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
      await _supabase.rpc('follow_user', params: {
        'cur_user_id': uid,
        'followed_user_id': followedId,
      });

      // Change following count update logic later -----
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
      await _supabase.rpc('unfollow_user', params: {
        'cur_user_id': uid,
        'followed_user_id': followedId,
      });

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
