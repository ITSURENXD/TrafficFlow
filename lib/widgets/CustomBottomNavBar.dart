import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final double iconSize; //icon size
  final Color color; //icon color, text color,

  const CustomBottomNavBar({
    this.iconSize = 18.0,
    this.color = const Color(0xffC67C4E),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.23),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            iconSize: iconSize,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.grey[600],
            tabs: [
              GButton(
                icon: FontAwesomeIcons.house,
                text: "Home",
                iconActiveColor: color,
              ),
              GButton(
                icon: FontAwesomeIcons.message,
                text: "Queries",
                iconActiveColor: color,
              ),
              GButton(
                icon: FontAwesomeIcons.userAstronaut,
                text: "Profile",
                iconActiveColor: color,
              ),
              GButton(
                icon: FontAwesomeIcons.gear,
                text: "Settings",
                iconActiveColor: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
