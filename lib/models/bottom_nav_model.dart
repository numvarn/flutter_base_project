import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  int _selectedIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  get getSelectedIndex => _selectedIndex;
  get getCarouselController => buttonCarouselController;

  void setIndex(int index) {
    _selectedIndex = index;
    buttonCarouselController.animateToPage(
      index,
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  void setIndexBySlider(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
