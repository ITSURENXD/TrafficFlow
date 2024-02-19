import "package:flutter/material.dart";
import "package:trafficflowdev/models/user.dart";
import "package:trafficflowdev/resources/auth_methods.dart";

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDeatils();
    _user = user;
    notifyListeners();
  }
}
