import 'package:flutter/material.dart';

class PhotosModel extends ChangeNotifier {
  List<String> _imgLinks = [];
  String _imgUrl = "";

  get imgUrl => _imgUrl;
  get imgLinks => _imgLinks;
  get imgLinksLength => _imgLinks.length;

  void setImgUrl(String imgUrl) {
    _imgUrl = imgUrl;
    notifyListeners();
  }

  void setLink(List<String> imgLinks) {
    _imgLinks = imgLinks;
    notifyListeners();
  }

  void appendLinks(List<String> imgLinks) {
    _imgLinks.addAll(imgLinks);
    notifyListeners();
  }
}
