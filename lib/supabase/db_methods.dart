import 'dart:io';

import 'dart:typed_data';

import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:provider/provider.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitness_app/models/user.dart' as model;

class DbMethods {
  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      final data =
          await _supabase.from('users').select().eq('id', userId).single();

      return data;
    } on PostgrestException catch (e) {
      print('Exception caught: $e');
      // You can throw the exception or create a custom exception
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<String?> uploadProfilePic(Uint8List profilePic) async {
    final curUser = _supabase.auth.currentUser!;
    final fileName = '${curUser.id}.jpg';

    // Upload profile picture to storage bucket
    File pfpAsFile =
        await UtilMethods.createFileFromBytes(profilePic, fileName);

    await _supabase.storage.from('images').upload(
          'profilepics/$fileName',
          pfpAsFile,
          fileOptions: FileOptions(
            cacheControl: 'max-age=3600', // Cache for 1 hour
            upsert: true, // Overwrite the file if it already exists
          ),
        );

    // Retrieve the photo URL
    final photoUrl =
        _supabase.storage.from('images').getPublicUrl('profilepics/$fileName');

    return photoUrl;
  }
}
