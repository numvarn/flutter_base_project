import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '/models/images_model.dart';
import '/models/user_model.dart';
import '/constants.dart';
import '/models/bottom_nav_model.dart';
import '/screens/details/details_screen.dart';
import '/screens/gallery/gallery_screen.dart';
import '/screens/home/home_screen.dart';

class BodyOperations extends StatefulWidget {
  const BodyOperations({Key key}) : super(key: key);

  @override
  _BodyOperationsState createState() => _BodyOperationsState();
}

class _BodyOperationsState extends State<BodyOperations> {
  UserModel userModel;
  ImageModel imageModel;

  Size size;
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    userModel = context.read<UserModel>();
    imageModel = context.read<ImageModel>();
  }

  /*
  * Get user profile
  */
  Future<String> _getUserProfile() async {
    await FirebaseFirestore.instance.collection('images').where('user', isEqualTo: userModel.profile['email']).get().then((value) {
      List<Map<String, dynamic>> images = [];
      List<String> links = [];
      value.docs.forEach((element) async {
        images.add(element.data());
        // * get image download link
        await firebase_storage.FirebaseStorage.instance.ref(element.data()['image']).getDownloadURL().then((link) {
          if (link != null) {
            links.add(link);
          }
        });
      });

      imageModel.setImages(images);
    });

    return "202";
  }

  @override
  Widget build(BuildContext context) {
    print("build operation screen");
    size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: _getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        });
  }
}
