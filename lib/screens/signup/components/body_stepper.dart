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
  SignupValidation validationService;

  CarouselController controller;
  PageController pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    validationService = Provider.of<SignupValidation>(context);

    controller = context.watch<SignupValidation>().getCarouselController;
    pageController = context.watch<SignupValidation>().getPageController;

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
            child: Stack(
              children: [
                CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    initialPage: 0,
                    height: size.height,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      validationService.setIndexBySlider(index);
                    },
                  ),
                  items: [
                    AccountForm(),
                    ProfileForm(),
                    ContactForm(),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotColor: kPrimaryLightColor.withOpacity(0.5),
                        activeDotColor: kPrimaryLightColor,
                        expansionFactor: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
