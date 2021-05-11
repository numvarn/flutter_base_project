// ignore: unused_import
import 'package:base_project/components/img_cached_cover_container.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/models/bottom_nav_model.dart';
import 'package:base_project/screens/gallery/gallery_screen.dart';
import 'package:base_project/screens/home/home_widget.dart';
import 'package:base_project/screens/profile/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyOperations extends StatefulWidget {
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
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
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
              ],
            ),
          ),
        ),
        Consumer<BottomNavModel>(builder: (context, bottomNavModel, child) {
          return CarouselSlider(
            carouselController: bottomNavModel.getCarouselController,
            options: CarouselOptions(
              viewportFraction: 1.0,
              initialPage: 0,
              height: size.height,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                bottomNavModel.setIndexBySlider(index);
              },
            ),
            items: [
              /*
              * Page Number #1
              */
              HomeScreen(),
              /*
              * Page Number #2
              */
              GalleryScreen(),
              /*
              * Page Number #3
              */
              Text("3"),
              /*
              * Page Number #4
              */
              ProfileScreen(),
            ],
          );
        }),
      ],
    );
  }
}
