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
          await _supabase.rpc('get_user_details', params: {'user_id': uid});

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
      final res = await _supabase.rpc('get_friendship_status',
          params: {'user_id1': uid, 'user_id2': followedId});

      // Fix this later
      if (res == 'pending') {
        return true;
      } else {
        return false;
      }
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
      await _supabase.rpc('create_friendship', params: {
        'user_id1': uid,
        'user_id2': followedId,
      });
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
      await _supabase.rpc('remove_friend', params: {
        'user_id1': uid,
        'user_id2': followedId,
      });
    } on PostgrestException catch (e) {
      // Handle exceptions or errors
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
