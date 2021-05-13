import 'package:base_project/components/img_cached_gallery_container.dart';
import 'package:base_project/components/select_photo_container.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

class BodyUploadPhotos extends StatefulWidget {
  @override
  _BodyUploadPhotosState createState() => _BodyUploadPhotosState();
}

class _BodyUploadPhotosState extends State<BodyUploadPhotos> {
  /*
  * Multiple select photo arg.
  */
  final int maxImageLimit = 3;
  bool isSelectedImage = false;

  // List image for preview only, dynamic type.
  List<dynamic> listImageForPreview = [];

  // List image for upload only, asset type only.
  List<Asset> listImagesForUpload = [];

  /*
   * For load load image from device gallery
  */
  Future<void> loadAssets() async {
    List<Asset> resultList = [];

    try {
      resultList = await MultiImagePicker.pickImages(
        enableCamera: true,
        maxImages: listImageForPreview.length < maxImageLimit ? maxImageLimit - listImageForPreview.length : 0,
      );
    } on Exception catch (err) {
      print(err);
      // Set previous images if user cancel select image.

      if (!isSelectedImage) {
        setState(() {
          isSelectedImage = false;
        });
      }
      return;
    }

    if (!mounted) return;

    if (listImageForPreview.length != 0) {
      // Add image if images not fully. (3 Image).
      if (listImageForPreview.length < maxImageLimit && (resultList.length + listImageForPreview.length) <= maxImageLimit) {
        setState(() {
          listImagesForUpload.addAll(resultList);
          listImageForPreview.addAll(resultList);

          isSelectedImage = true;
        });
        return;
      }
    }
    // First select image.
    else if (resultList.length != 0) {
      setState(() {
        listImagesForUpload.addAll(resultList);
        listImageForPreview.addAll(resultList);
        isSelectedImage = true;
      });
      return;
    }
  }

  /*
   * On Remove image selected
  */
  void _onRemoveImageSelected(Asset asset) {
    for (int i = 0; i < listImageForPreview.length; i++) {
      if (listImageForPreview[i] is Asset) {
        Asset prevStatePreview = listImageForPreview[i];
        if (prevStatePreview.name == asset.name) {
          setState(() => listImageForPreview.removeAt(i));
        }
        for (int j = 0; j < listImagesForUpload.length; j++) {
          Asset prevStateUpload = listImagesForUpload[j];
          if (prevStateUpload.name == asset.name) {
            setState(() => listImagesForUpload.removeAt(j));
          }
        }
      }
    }
  }

  void _onShowDialogConfirmRemove(int imgID) {
    print("Hello");
  }

  /*
  * --------------------------
  */

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Photos Upload",
                  style: header1Style,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "เลือกภาพต้องต้อการเพื่ออัปโหลดเข้าสู่ระบบ",
                  style: descTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Flexible(
              child: listImageForPreview.length > 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(12),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: [
                            for (var index = 0; index < listImageForPreview.length; index++)
                              Stack(
                                fit: StackFit.expand,
                                children: [
                                  // * Container image.
                                  Container(
                                    width: (size.height * 0.2).round() + .0,
                                    height: (size.height * 0.2).round() + .0,
                                    child: Card(
                                        margin: EdgeInsets.all(0),
                                        semanticContainer: true,
                                        elevation: 0.2,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                        child: listImageForPreview[index].runtimeType != Asset
                                            ? CachedImageGalleryContainer(
                                                imgUrl: listImageForPreview[index]['image'],
                                              )
                                            : AssetThumb(
                                                asset: listImageForPreview[index],
                                                width: (size.height * 0.2).round(),
                                                height: (size.height * 0.2).round(),
                                              )),
                                  ),
                                  // * Cancel select image.
                                  Positioned(
                                    right: 6,
                                    top: 6,
                                    child: Container(
                                      height: 28,
                                      width: 28,
                                      child: Center(
                                        child: ClipOval(
                                          child: Material(
                                            color: Colors.white.withOpacity(0.75),
                                            child: IconButton(
                                              onPressed: () {
                                                listImageForPreview[index] is Asset
                                                    ? _onRemoveImageSelected(listImageForPreview[index])
                                                    : _onShowDialogConfirmRemove(listImageForPreview[index]['id']);
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                size: 13,
                                              ),
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (listImageForPreview.length < maxImageLimit)
                              Container(
                                height: size.height * 0.55,
                                child: Center(
                                  child: SelectPhotosContainer(
                                    title: "เลือก QR Code",
                                    onPressed: () => loadAssets(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _chooseQRCodeBox(context),
                      ],
                    ),
            ),
            // * Bottom action.
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: outlineButtonWideStyle,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ยกเลิก"),
                  ),
                  TextButton(
                    style: outlineButtonWideStyle,
                    onPressed: () {},
                    child: Text("อัปโหลด"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // * widget for select qrcode image when image is empty
  Widget _chooseQRCodeBox(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SelectPhotosContainer(
              title: "เลือก QR Code",
              onPressed: () => loadAssets(),
            ),
          ],
        ),
      ),
    );
  }
}
