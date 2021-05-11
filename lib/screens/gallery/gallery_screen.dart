import 'package:base_project/components/img_cached_gallery_container.dart';
import 'package:base_project/data/image_network.dart';
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
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 6.0,
            padding: const EdgeInsets.all(10.0),
            children: List.generate(galleryList.length, (index) {
              return Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1,
                child: CachedImageGalleryContainer(
                  imgUrl: "${galleryList[index]}",
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
