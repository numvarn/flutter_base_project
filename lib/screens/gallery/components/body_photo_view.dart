import 'package:base_project/components/img_cached_gallery_container.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/data/image_network.dart';
import 'package:base_project/models/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PhotoViewBody extends StatefulWidget {
  const PhotoViewBody({Key key}) : super(key: key);
  @override
  _PhotoViewBodyState createState() => _PhotoViewBodyState();
}

class _PhotoViewBodyState extends State<PhotoViewBody> with AutomaticKeepAliveClientMixin<PhotoViewBody> {
  Size size;
  List<String> filename = [];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    size = MediaQuery.of(context).size;

    // Get date time now
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('H:m, yyyy-MM-dd');
    final String dateFormatted = formatter.format(now);

    return Container(
      child: Consumer<PhotosModel>(
        builder: (context, photosModel, child) {
          filename = photosModel.imgUrl.split(".");
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*
             * Header Image
             */
              CachedImageGalleryContainer(
                imgUrl: photosModel.imgUrl,
                height: 350,
              ),
              Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Hey Customers,",
                        style: header1Style,
                      ),
                      Text(
                        "Find the course you want to learn.",
                        style: subHeaderStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              /*
            * Content
            */
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 0, top: 0),
                child: ListTile(
                  leading: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: CachedImageGalleryContainer(
                        imgUrl: photosModel.imgUrl,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  title: Text(
                    "Phisan Sookkhee",
                    style: header2Style,
                  ),
                  subtitle: Text("Sisaket Rajabhat University"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Text(
                  "รายละเอียด",
                  style: header2Style,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'วันที่',
                      style: descTextStyle,
                    ),
                    Text(
                      '$dateFormatted',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ขนาด',
                      style: descTextStyle,
                    ),
                    Text(
                      '30 Kb',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ประเภท',
                      style: descTextStyle,
                    ),
                    Text(
                      '${filename[filename.length - 1].toUpperCase()}',
                    ),
                  ],
                ),
              ),
              Divider(),
              /*
             * Scrollable ListView 
            */
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(galleryList.length, (index) {
                      return Container(
                        width: 80,
                        // color: Colors.purple[600],
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200.0),
                            child: InkWell(
                              child: CachedImageGalleryContainer(
                                imgUrl: galleryList[index],
                                height: 70,
                                width: 70,
                              ),
                              onTap: () {
                                photosModel.setImgUrl(galleryList[index]);
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
          );
        },
      ),
    );
  }
}
