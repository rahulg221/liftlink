import 'package:fitness_app/firebase/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  // Function to return user
  User get getUser => _user!;

  // Function to refresh user
  Future<void> refreshUser() async {
    User user = await AuthMethods().getUserDetails();
    _user = user;

    // Notify all listeners to this provider that the data has changed
    notifyListeners();
  }
}
