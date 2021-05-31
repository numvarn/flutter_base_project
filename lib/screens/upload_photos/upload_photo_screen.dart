import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/upload_photos/components/body_upload.dart';

class UploadPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: kPrimaryColor),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BodyUploadPhotos(),
    );
  }
}
