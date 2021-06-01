import 'package:flutter/material.dart';

class PhotosModel extends ChangeNotifier {
  List<String> _imgLinks = [];
  String _imgUrl = "";

  get imgUrl => _imgUrl;
  get imgLinks => _imgLinks;

  void setImgUrl(String imgUrl) {
    _imgUrl = imgUrl;
    notifyListeners();
  }

  void setLink(List<String> imgLinks) {
    _imgLinks = imgLinks;
    notifyListeners();
  }

  void addLink(List<String> imgLinks) {
    _imgLinks.addAll(imgLinks);
    notifyListeners();
  }
}
