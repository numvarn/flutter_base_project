import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _uid = '';
  String _docID = '';
  Map<String, dynamic> _profile = {};

  // * set and get user id
  get uid => _uid;
  get docID => _docID;
  void setCurrentUserID(value) {
    _uid = value;
    notifyListeners();
  }

  void setCurrentDocID(value) {
    _docID = value;
    notifyListeners();
  }

  // * get and get user profile
  get profile => _profile;
  void setProfile(profile) {
    _profile = profile;
    notifyListeners();
  }
}
