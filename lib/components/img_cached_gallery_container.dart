import 'package:base_project/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageGalleryContainer extends StatelessWidget {
  final String imgUrl;

  const CachedImageGalleryContainer({
    Key key,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      filterQuality: FilterQuality.low,
      fadeOutCurve: Curves.fastOutSlowIn,
      cacheKey: imgUrl,
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
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
    );
  }
}
