import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/user.dart' as model;

class UserProvider with ChangeNotifier {
  model.User? _user;

  // Function to return user
  model.User get getUser => _user!;

  // Function to refresh user
  Future<void> refreshUser() async {
    try {
      // Get the user data
      model.User user =
          await DbMethods().getUserDetails(supabase.auth.currentUser!.id);

      _user = user;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        e.toString();
      }
    }
  }
}
