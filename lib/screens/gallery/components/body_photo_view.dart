import 'package:base_project/constants.dart';
import 'package:base_project/data/image_network.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoViewBody extends StatefulWidget {
  final photoIndex;

  const PhotoViewBody({Key key, @required this.photoIndex}) : super(key: key);
  @override
  _PhotoViewBodyState createState() => _PhotoViewBodyState();
}

class _PhotoViewBodyState extends State<PhotoViewBody> {
  @override
  Widget build(BuildContext context) {
    String imgUrl = galleryList[widget.photoIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*
         * Header Image
         */
        CachedNetworkImage(
          filterQuality: FilterQuality.low,
          fadeOutCurve: Curves.fastOutSlowIn,
          cacheKey: imgUrl,
          imageUrl: imgUrl,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          placeholder: (context, _) => SizedBox(
            height: 100,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: kPrimaryColor,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
          errorWidget: (_, __, ___) => SizedBox(
            height: 100,
            width: 100,
            child: Center(
                child: Icon(
              Icons.error_outline_rounded,
              color: Colors.grey[500],
            )),
          ),
        )
        /*
        * Content
        */
      ],
    );
  }
}
