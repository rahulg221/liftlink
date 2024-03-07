import 'dart:typed_data';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitness_app/models/user.dart' as model;

class AuthMethods {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signUp(String email, String password) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    return res;
  }
}
