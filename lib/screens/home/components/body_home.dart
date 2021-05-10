import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BodyHomeScreen extends StatefulWidget {
  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
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
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) => new Container(
                    color: Colors.green,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text('$index'),
                      ),
                    )),
                staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 1),
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
