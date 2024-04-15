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
          .rpc('search_for_users', params: {'username_pattern': username});

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
  Future<String> getFriendshipStatus(String userId1, String userId2) async {
    try {
      // Check if the current user follows the user
      final res = await _supabase.rpc('get_friendship_status',
          params: {'user_id1': userId1, 'user_id2': userId2});

      return res;
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<model.User>> getFriendRequests(String userId1) async {
    try {
      // Check if the current user follows the user
      List<Map<String, dynamic>> friendRequests = await _supabase
          .rpc('get_friend_requests', params: {'user_id1': userId1});

      return friendRequests.map((user) => model.User.fromJson(user)).toList();
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> addFriend(String userId1, String userId2) async {
    try {
      // Insert the follower details into the 'followers' table
      await _supabase.rpc('create_friendship', params: {
        'user_id1': userId1,
        'user_id2': userId2,
      });
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> removeFriend(String userId1, String userId2) async {
    try {
      // Delete the follower details from the 'followers' table
      await _supabase.rpc('remove_friend', params: {
        'user_id1': userId1,
        'user_id2': userId2,
      });
    } on PostgrestException catch (e) {
      // Handle exceptions or errors
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> acceptFriend(String userId1, String userId2) async {
    try {
      // Delete the follower details from the 'followers' table
      await _supabase.rpc('accept_friend', params: {
        'user_id1': userId1,
        'user_id2': userId2,
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
