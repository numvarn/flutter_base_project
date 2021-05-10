import 'package:base_project/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageContainer extends StatelessWidget {
  final String imgUrl;
  final int height;
  final int width;

  const CachedImageContainer({
    Key key,
    @required this.imgUrl,
    this.height = 100,
    this.width,
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
          height: this.height.toDouble(),
          width: this.width != null ? this.width.toDouble() : this.height.toDouble(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(18.0),
            ),
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
