import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '/components/img_cached_gallery_container.dart';
import '/constants.dart';
import '/data/image_network.dart';
import '/models/photos_model.dart';
import '/screens/gallery/photo_view_screen.dart';
import '/screens/upload_photos/upload_photo_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key key}) : super(key: key);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> with AutomaticKeepAliveClientMixin<GalleryScreen> {
  @override
  bool get wantKeepAlive => true;

  Future<void> _onRefresh() async {
    await new Future.delayed(new Duration(seconds: 1));
    print("Refresh");
  }

  @override
  Widget build(BuildContext context) {
    print("build gallery page");

    super.build(context);
    Size size = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: () => _onRefresh(),
      backgroundColor: kPrimaryLightColor,
      color: kPrimaryColor,
      displacement: 200,
      strokeWidth: 2,
      child: Container(
        child: Padding(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UploadPhotos()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<PhotosModel>(
                builder: (context, photosModel, child) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: StaggeredGridView.countBuilder(
                      padding: EdgeInsets.only(bottom: size.height * .4),
                      // crossAxisCount: 4,
                      crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 8 : 4,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0,
                      itemCount: galleryList.length,
                      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 2),
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 2,
                            child: CachedImageGalleryContainer(
                              imgUrl: "${galleryList[index]}",
                            ),
                          ),
                          onTap: () {
                            photosModel.setImgUrl(galleryList[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PhotoviewScreen()),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
