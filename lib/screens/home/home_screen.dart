import 'dart:async';
import '/components/img_cached_gallery_container.dart';
import '/constants.dart';
import '/data/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh() async {
    await new Future.delayed(new Duration(seconds: 1));
    print("Refreshed");
  }

  @override
  Widget build(BuildContext context) {
    print("build home screen");

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
                    "Category",
                    style: header2Style,
                  ),
                  TextButton(
                    child: Text(
                      "See All",
                      style: header2Style,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: false,
                  crossAxisCount: 4,
                  itemCount: imgsList.length,
                  padding: EdgeInsets.only(bottom: size.height * .4),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedImageGalleryContainer(
                            imgUrl: imgsList[index],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                        ),
                        Positioned(
                          bottom: 15,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Category #$index",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 3 : 2),
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
