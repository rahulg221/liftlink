import 'package:fitness_app/supabase/auth_methods.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/user.dart' as model;

class UserProvider with ChangeNotifier {
  model.User? _user;

  // Function to return user
  model.User get getUser => _user!;

  // Function to refresh user
  Future<void> refreshUser() async {
    try {
      if (supabase.auth.currentUser != null) {
        print('user logged in');
      } else {
        print('user not logged in');
      }

      final data =
          await DbMethods().getUserDetails(supabase.auth.currentUser!.id);

      print(data);
      model.User user = model.User.fromJson(data);

      _user = user;

      print(user.username);

      notifyListeners(); // Notify all listeners to this provider that the data has changed
    } catch (e) {
      print('Error refreshing user: $e');
    }
  }
}
