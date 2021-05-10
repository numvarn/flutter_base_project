import 'package:base_project/models/bottom_nav_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BodyOperations extends StatefulWidget {
  @override
  _BodyOperationsState createState() => _BodyOperationsState();
}

class _BodyOperationsState extends State<BodyOperations> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text("Silver AppBar"),
          ),
          SliverAnimatedSwitcher(
            duration: Duration(microseconds: 300),
            child: SliverToBoxAdapter(
              child: Consumer<BottomNavModel>(
                builder: (context, bottomNavModel, child) {
                  return CarouselSlider(
                    carouselController: bottomNavModel.getCarouselController,
                    options: CarouselOptions(
                      height: size.height,
                      viewportFraction: 1.0,
                      initialPage: bottomNavModel.getSelectedIndex,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        bottomNavModel.setIndexBySlider(index);
                      },
                    ),
                    items: [1, 2, 3, 4].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.amber[50]),
                              child: Center(
                                child: Text(
                                  'text $i',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ));
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
