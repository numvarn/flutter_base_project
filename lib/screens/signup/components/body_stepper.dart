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

    Size size = MediaQuery.of(context).size;
    return Background(
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Container(
                  width: size.width * .85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "สร้างบัญชีผู้ใช้งานใหม่",
                        style: pageHeaderStyle,
                      ),
                      Text(
                        "กรอกข้อมูลส่วนตัวให้ครบถ้วน",
                        style: pageSubHeaderStyle,
                      ),
                      Text(
                        "และบันทึกเพื่อสร้างบัญชีผู้ใช้งานระบบรายใหม่",
                        style: pageSubHeaderStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedSmoothIndicator(
                        activeIndex: validationService.getSelectedIndex,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey.withOpacity(0.3),
                          activeDotColor: kPrimaryLightColor,
                          expansionFactor: 2,
                        ),
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
