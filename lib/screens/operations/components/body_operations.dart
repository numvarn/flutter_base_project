import 'package:base_project/constants.dart';
import 'package:base_project/models/bottom_nav_model.dart';
import 'package:base_project/screens/home/home_screen.dart';
import 'package:base_project/screens/profile/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      HomeScreen(),
      ProfileScreen(),
      ProfileScreen(),
      ProfileScreen(),
    ];
  }

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
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
        SliverToBoxAdapter(
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
        )
      ],
    );
/*
    return SmartRefresher(
      child: Container(
        // * Main Body Page
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
      enablePullDown: true,
      // header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
    );
    */
  }
}
