import 'package:base_project/components/dialog_confirm.dart';
import 'package:base_project/components/img_cached_gallery_container.dart';
import 'package:base_project/components/select_photo_container.dart';
import 'package:base_project/data/image_network.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

class BodyUploadPhotos extends StatefulWidget {
  @override
  _BodyUploadPhotosState createState() => _BodyUploadPhotosState();
}

class _BodyUploadPhotosState extends State<BodyUploadPhotos> {
  /*
  * Multiple select photo argument.
  */
  final int maxImageLimit = 3;
  bool isSelectedImage = false;

  /*
  * List image for preview only, dynamic type.
  */
  List<dynamic> listImageForPreview = [];

  /*
  * List image for upload only, asset type only.
  */
  List<Asset> listImagesForUpload = [];

  @override
  void initState() {
    super.initState();

    /*
    * Add uploaded image to preview list
    * Add init image for preview only from product image.
    */
    if (uploadedImage.length != 0) {
      uploadedImage.forEach((element) {
        listImageForPreview.add(element);
      });
    }
  }

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
      // Add image if images not fully. (limited by maxImageLimit).
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

  /*
  * Delete uploaded photo
  */
  void _onShowDialogConfirmRemove(int imgID) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomConfirmDialog(
            title: "ลบรูปภาพออกจากระบบ",
            subtitle: "กรุณากดยืนยันเพื่อดำเนินการต่อ",
            onpress: () {
              setState(() {
                listImageForPreview.removeWhere((element) => element.runtimeType != Asset && element['id'] == imgID);
                Navigator.pop(context);
              });
            },
          );
        });
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
                    onPressed: isSelectedImage && listImagesForUpload.length != 0
                        ? () => showDialog(
                            context: context,
                            builder: (context) {
                              return CustomConfirmDialog(
                                title: "ดำเนินการอัปโหลด",
                                subtitle: "ต้องการดำเนินการต่อกรุณากดปุ่มยืนยัน",
                                onpress: () {
                                  print("Uploading");
                                  // _uploadProcess(listImageForUpload);
                                  Navigator.pop(context);
                                },
                              );
                            })
                        : null,
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

  /*
   * Upload Image process 
   */
  /*
  // For upload data by using MultipathRequest
  Future<Null> _uploadProcess({@required List<Asset> listImageForUpload, @required int productId}) async {
    // get current user token
    String token = settingModel.value['token'];

    // string to uri
    Uri uri = Uri.parse('${settingModel.baseURL}/${settingModel.endPointUploadProductImage}');

    // create multipart request
    MultipartRequest request = MultipartRequest("POST", uri);

    for (Asset asset in listImageForUpload) {
      ByteData byteData = await asset.getByteData(quality: 30);
      List<int> imageData = byteData.buffer.asUint8List();

      MultipartFile multipartFile = MultipartFile.fromBytes(
        'image',
        imageData,
        filename: 'image.jpg',
      );

      // add access token to header
      request.headers['authorization'] = "Token $token";

      // add file to multipart
      request.files.add(multipartFile);
    }

    //adding params Product ID
    request.fields['product'] = "$productId";

    // Upload photo and wait for response
    try {
      pr.show();
      Response response = await Response.fromStream(await request.send());
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      if (jsonData['status']) {
        pr.hide();
        productImageModel.addImage(listImage: jsonData['data']);
        showFlashBar(context, message: 'อัพโหลดรูปภาพสำเร็จ', success: true);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewProductScreen(productId: productId),
          ),
        );
      }
    } catch (e) {
      showFlashBar(context, message: 'เกิดข้อผิดพลาดบางอย่าง', error: true);
      pr.hide();
      print(e.toString());
    }
  }
  */
}
