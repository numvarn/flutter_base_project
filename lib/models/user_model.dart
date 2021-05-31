import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _uid = '';
  Map<String, dynamic> _profile = {};

  // * set and get user id
  get uid => _uid;

  void setCurrentUserID(value) {
    _uid = value;
    notifyListeners();
  }

  // * get and get user profile
  get profile => _profile;
  void setProfile(profile) {
    _profile = profile;
    notifyListeners();
  }

  void clear() {
    _uid = '';
    _profile.clear();
  }
}
