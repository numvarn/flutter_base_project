import 'package:base_project/components/img_cached_cover_container.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BodyHomeScreen extends StatefulWidget {
  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  List<String> imgsList = [
    'https://img.lovepik.com//back_pic/05/56/69/365b1f2c251c72e.jpg',
    'https://png.pngtree.com/thumb_back/fw800/back_our/20190628/ourmid/pngtree-summer-good-night-starry-background-design-image_279964.jpg',
    'https://i.pinimg.com/736x/b5/a2/ee/b5a2ee2d427f3beeade647b95eb8f027.jpg',
    'https://static.photocdn.pt/images/articles/2018/12/03/articles/2017_8/mountain-landscape-ponta-delgada-island-azores-picture-id944812540.jpg',
    'https://www.stockvault.net/data/2007/03/01/102413/thumb16.jpg',
    'https://jooinn.com/images/beautiful-landscape-13.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: imgsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedImageCoverContainer(
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
    );
  }
}
