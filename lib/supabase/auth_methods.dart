import 'dart:typed_data';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitness_app/models/user.dart' as model;

abstract class AuthMethods {
  Future<String> signInEmailAndPassword(String email, String password);
  Future<String> signUpEmailAndPassword(String email, String password);

  Future<void> signOut();
}

class SupabaseAuthMethods implements AuthMethods {
  final SupabaseClient _supabase;

  SupabaseAuthMethods(this._supabase);

  @override
  Future<String> signInEmailAndPassword(String email, String password) async {
    try {
      final res = await _supabase.auth
          .signInWithPassword(email: email, password: password);

      return res.toString();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> signUpEmailAndPassword(String email, String password) async {
    try {
      final res = await _supabase.auth.signUp(email: email, password: password);

      return res.toString();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
    return;
  }
}
