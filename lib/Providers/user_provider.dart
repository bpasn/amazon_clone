import 'package:amasona_clone/Models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  // ignore: prefer_final_fields, unused_field
  User _user = User(
      id: '',
      name: '',
      address: '',
      email: '',
      password: '',
      token: '',
      type: '');

  // ignore: recursive_getters
  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
