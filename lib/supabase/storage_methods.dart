import 'dart:async';
import 'dart:io';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageMethods {
  final _supabase = Supabase.instance.client;

  Future<String?> uploadProfilePic(Uint8List profilePic, String uid) async {
    final fileName = '$uid.jpg';

    try {
      // Convert the Uint8List to a File
      File pfpAsFile =
          await UtilMethods.createFileFromBytes(profilePic, fileName);

      // Upload the file to the storage bucket
      await _supabase.storage.from('images').upload(
            'profilepics/$fileName',
            pfpAsFile,
            fileOptions: const FileOptions(
              cacheControl: '3600', // 1 hour cache
              upsert: true,
            ),
          );

      // Retrieve the photo URL
      final photoUrl = _supabase.storage
          .from('images')
          .getPublicUrl('profilepics/$fileName');

      return photoUrl;
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<String?> uploadPostPic(Uint8List postPic, String uid) async {
    final fileName = '${uid + DateTime.now().toString()}.jpg';

    try {
      // Convert the Uint8List to a File
      File pfpAsFile = await UtilMethods.createFileFromBytes(postPic, fileName);

      // Upload the file to the storage bucket
      await _supabase.storage.from('images').upload(
            'postpics/$fileName',
            pfpAsFile,
            fileOptions: const FileOptions(
              cacheControl: '3600', // 1 hour cache
              upsert: true,
            ),
          );

      // Retrieve the photo URL
      final photoUrl =
          _supabase.storage.from('images').getPublicUrl('postpics/$fileName');

      return photoUrl;
    } on PostgrestException catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    } catch (e) {
      // Print errors to console when in debug mode
      if (kDebugMode) {
        print(e.toString());
      }

      throw Exception('An unexpected error occurred: $e');
    }
  }
}
