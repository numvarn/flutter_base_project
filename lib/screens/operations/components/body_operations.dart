import 'package:base_project/models/bottom_nav_model.dart';
import 'package:base_project/screens/profile/profile.dart';
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
  List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = [
      ProfileScreen(),
      ProfileScreen(),
      ProfileScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
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
                    items: screenList,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
