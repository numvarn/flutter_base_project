import 'package:base_project/models/images_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '/components/dialog_confirm.dart';
import '/components/img_cached_gallery_container.dart';
import '/constants.dart';
import '/screens/gallery/components/body_photo_view.dart';

class PhotoviewScreen extends StatelessWidget {
  const PhotoviewScreen({Key key}) : super(key: key);

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
            onPressed: () {
              _onShareWithEmptyOrigin(context);
            },
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
        child: PhotoViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayBottomSheet(context),
        child: Icon(Icons.image_outlined),
      ),
    );
  }

  void _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("ทุเรียนลาวา ศรีสะเกษ\nhttps://www.lavadurian.com/shopping/product/195");
  }

  /*
   * Scrollable ListView 
   */
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Consumer<ImageModel>(
              builder: (context, imageModel, child) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "My Gallery",
                          style: pageSubHeaderStyle,
                        ),
                      ),
                      SizedBox(
                        height: boxMarginBottom,
                      ),
                      Center(
                        child: Container(
                          height: 70,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(imageModel.length, (index) {
                              return Container(
                                width: 80,
                                // color: Colors.purple[600],
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200.0),
                                    child: InkWell(
                                      child: CachedImageGalleryContainer(
                                        imgUrl: imageModel.images[index]['link'] ?? "",
                                        height: 70,
                                        width: 70,
                                      ),
                                      onTap: () {
                                        imageModel.setShowIndex(index);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
