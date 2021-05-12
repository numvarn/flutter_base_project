import 'package:flutter/material.dart';

class PhotosModel extends ChangeNotifier {
  String _imgUrl = "";

  get imgUrl => _imgUrl;

  void setImgUrl(String imgUrl) {
    _imgUrl = imgUrl;
    notifyListeners();
  }
}
