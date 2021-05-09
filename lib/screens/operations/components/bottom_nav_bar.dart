import 'package:base_project/constants.dart';
import 'package:base_project/models/bottom_nav_model.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Consumer<BottomNavModel>(
        builder: (context, bottomNavModel, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 300),
                tabBackgroundColor: kPrimaryLightColor.withOpacity(0.6),
                color: kPrimaryColor,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    textStyle: bottomTextStyle,
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Likes',
                    textStyle: bottomTextStyle,
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: 'Search',
                    textStyle: bottomTextStyle,
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    textStyle: bottomTextStyle,
                  ),
                ],
                selectedIndex: bottomNavModel.selectedIndex,
                onTabChange: (index) {
                  bottomNavModel.setIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
