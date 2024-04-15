import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitness_app/models/session.dart' as model;

class SessionMethods {
  final _supabase = Supabase.instance.client;

  Future<void> createSession(
      String uid,
      String username,
      String profilePicUrl,
      String workoutType,
      String workoutDateTime,
      bool friendsCanSee,
      bool myGymCanSee) async {
    try {
      await _supabase.rpc('create_session', params: {
        'user_id': uid,
        'username': username,
        'workout_type': workoutType,
        'workout_date_time': workoutDateTime,
        'friends_can_join': friendsCanSee,
        'my_gym_can_join': myGymCanSee,
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

  Future<List<model.Session>> getFriendSessions(
      String uid, int count, int startIndex) async {
    try {
      List<Map<String, dynamic>> sessions = await _supabase
          .rpc('get_friend_sessions', params: {
        'user_id': uid,
        'session_count': count,
        'start_index': startIndex
      });

      return sessions
          .map((session) => model.Session.fromJson(session))
          .toList();
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<model.Session>> getMyGymSessions(
      String uid, int count, int startIndex) async {
    try {
      List<Map<String, dynamic>> sessions = await _supabase
          .rpc('get_my_gym_sessions', params: {
        'user_id': uid,
        'session_count': count,
        'start_index': startIndex
      });

      return sessions
          .map((session) => model.Session.fromJson(session))
          .toList();
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
