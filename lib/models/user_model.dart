import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  bool _hasProfile = true;
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

  // * check current user already has profile
  get hasProfile => _hasProfile;
  void setHasProfile(bool check) {
    _hasProfile = check;
    notifyListeners();
  }

  void clear() {
    _uid = '';
    _profile.clear();
  }
}
