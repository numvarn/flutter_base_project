import 'package:flutter/material.dart';

class ImageModel extends ChangeNotifier {
  List<Map<String, dynamic>> _images = [];
  int _showIndex = 0;

  get images => _images;
  get length => _images.length;
  get showIndex => _showIndex;

  void setImages(List<Map<String, dynamic>> images) {
    _images = images;
    notifyListeners();
  }

  void addImages(List<Map<String, dynamic>> images) {
    _images.addAll(images);
    notifyListeners();
  }

  void setShowIndex(int index) {
    _showIndex = index;
    notifyListeners();
  }

  void clear() {
    _images.clear();
    _showIndex = 0;
  }
}
