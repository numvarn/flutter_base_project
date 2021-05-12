import 'package:base_project/components/img_cached_gallery_container.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/data/image_network.dart';
import 'package:base_project/screens/gallery/photo_view_screen.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> with AutomaticKeepAliveClientMixin<GalleryScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gallery",
                style: header2Style,
              ),
              TextButton(
                child: Text(
                  "Upload",
                  style: header2Style,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 6.0,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              children: List.generate(galleryList.length, (index) {
                return InkWell(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 1,
                    child: CachedImageGalleryContainer(
                      imgUrl: "${galleryList[index]}",
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoviewScreen(
                                photoIndex: index,
                              )),
                    );
                  },
                );
              }),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
