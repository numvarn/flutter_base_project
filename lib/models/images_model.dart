import 'package:flutter/material.dart';

class ImageModel extends ChangeNotifier {
  List<Map<String, dynamic>> _images = [];

  get images => _images;
  get length => _images.length;

  void setImages(List<Map<String, dynamic>> images) {
    _images = images;
    notifyListeners();
  }

  void addImages(List<Map<String, dynamic>> images) {
    _images.addAll(images);
    notifyListeners();
  }

  void clear() {
    _images.clear();
  }
}
