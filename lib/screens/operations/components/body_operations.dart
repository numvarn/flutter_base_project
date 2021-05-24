// ignore: unused_import
import 'package:base_project/constants.dart';
import 'package:base_project/models/bottom_nav_model.dart';
import 'package:base_project/screens/details/details_screen.dart';
import 'package:base_project/screens/gallery/gallery_screen.dart';
import 'package:base_project/screens/home/home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyOperations extends StatefulWidget {
  const BodyOperations({Key key}) : super(key: key);

  @override
  _BodyOperationsState createState() => _BodyOperationsState();
}

class _BodyOperationsState extends State<BodyOperations> {
  Size size;
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build operation screen");
    size = MediaQuery.of(context).size;

    return Container(
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFFFFFFF),
            automaticallyImplyLeading: false,
            pinned: true,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<BottomNavModel>(builder: (context, bottomNavModel, child) {
              return CarouselSlider(
                carouselController: bottomNavModel.getCarouselController,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  initialPage: bottomNavModel.getSelectedIndex,
                  height: size.height,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    bottomNavModel.setIndexBySlider(index);
                  },
                ),
                items: [
                  /*
                * Page Number #1
                */
                  const HomeScreen(),
                  /*
                * Page Number #2
                */
                  const GalleryScreen(),
                  /*
                * Page Number #3
                */
                  const DetailScreen(),
                  /*
                * Page Number #4
                */
                  const Text("Hello"), //SearchScreen(),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
