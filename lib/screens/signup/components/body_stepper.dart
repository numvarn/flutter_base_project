import 'package:base_project/screens/signup/components/account.dart';
import 'package:base_project/screens/signup/components/background.dart';
import 'package:base_project/screens/signup/components/contact.dart';
import 'package:base_project/screens/signup/components/profile.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyStepper extends StatefulWidget {
  @override
  _BodyStepperState createState() => _BodyStepperState();
}

class _BodyStepperState extends State<BodyStepper> {
  CarouselController controller;
  SmoothIndicator smoothIndicator;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = context.watch<SignupValidation>().getCarouselController;
    var smoothIndicator = PageController();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "สร้างบัญชีเพื่อเข้าใช้งาน",
              style: appBarStyle,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            expandedHeight: 100,
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                viewportFraction: 1.0,
                initialPage: 0,
                height: size.height,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
              ),
              items: [
                AccountForm(),
                ProfileForm(),
                ContactForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
