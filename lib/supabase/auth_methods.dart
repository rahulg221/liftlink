import 'package:fitness_app/supabase/storage_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthMethods {
  final _supabase = Supabase.instance.client;

  Future<String> signInEmailAndPassword(String email, String password) async {
    try {
      // Attempt to sign in the user with Supabase
      await _supabase.auth.signInWithPassword(email: email, password: password);

      return 'success';
    } on AuthException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'auth-exception';
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'unexpected-error';
    }
  }

  Future<String> signUpEmailAndPassword(String email, String password,
      String username, String bio, Uint8List profilePic) async {
    try {
      // Attempt to sign up the user with Supabase
      final res = await _supabase.auth.signUp(email: email, password: password);

      // Upload the profile picture to the storage bucket
      final profilePicUrl =
          await StorageMethods().uploadProfilePic(profilePic, res.user!.id);

      // Proceed to insert user details into the 'users' table
      await _supabase.rpc('create_user', params: {
        'id': res.user!.id,
        'email': email,
        'username': username,
        'fullname': '',
        'age': 19,
        'bio': bio,
        'profile_pic_url': profilePicUrl,
        'gym_location': '',
        'workout_split': '',
        'workout_style': '',
      });

      return 'success';
    } on AuthException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'auth-exception';
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'postgrest-exception';
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'unexpected-error';
    }
  }

  Future<String> signOut() async {
    try {
      // Attempt to sign out the user with Supabase
      await _supabase.auth.signOut();

      return 'success';
    } on AuthException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'auth-exception';
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      return 'unexpected-error';
    }
  }
}
