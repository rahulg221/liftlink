import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupMethods {
  final _supabase = Supabase.instance.client;

  Future<void> createGroup(String username, String uid, String profilePicUrl,
      String workoutType, DateTime workoutDateTime) async {
    try {
      await _supabase.rpc('create_group', params: {
        'username': username,
        'uid': uid,
        'profile_pic': profilePicUrl,
        'workout_type': workoutType,
        'workout_date_time': workoutDateTime,
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
