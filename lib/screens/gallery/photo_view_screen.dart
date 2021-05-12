import 'package:base_project/components/dialog_confirm.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/screens/gallery/components/body_photo_view.dart';
import 'package:flutter/material.dart';

class PhotoviewScreen extends StatelessWidget {
  final int photoIndex;
  const PhotoviewScreen({Key key, @required this.photoIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: kPrimaryColor),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomConfirmDialog(
                      title: "ลบข้อมูลรูปภาพ",
                      subtitle: "กรุณากดยืนยันเพื่อลบข้อมูล",
                      onpress: () {
                        Navigator.pop(context);
                      },
                    );
                  });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: PhotoViewBody(photoIndex: this.photoIndex),
      ),
    );
  }
}
