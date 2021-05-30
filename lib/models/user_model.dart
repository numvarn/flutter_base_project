import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _uid = '';

  get uid => _uid;
  void setCurrentUserID(value) {
    _uid = value;
    notifyListeners();
  }
}
