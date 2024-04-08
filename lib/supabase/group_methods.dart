import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupMethods {
  final _supabase = Supabase.instance.client;

  Future<void> createGroup(
      String uid,
      String username,
      String profilePicUrl,
      String workoutType,
      String workoutDateTime,
      bool friendsCanSee,
      bool myGymCanSee) async {
    try {
      await _supabase.rpc('create_group', params: {
        'uid': uid,
        'username': username,
        'profile_pic': profilePicUrl,
        'workout_type': workoutType,
        'workout_datetime': workoutDateTime,
        'friends_can_see': friendsCanSee,
        'my_gym_can_see': myGymCanSee,
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
