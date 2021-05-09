import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
