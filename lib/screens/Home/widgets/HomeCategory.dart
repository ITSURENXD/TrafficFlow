import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traffic_management/screens/Home/widgets/CategoryBox.dart';

class HomeCategory extends StatelessWidget {
  final textStyle = TextStyle(
    color: Colors.grey[600],
    fontWeight: FontWeight.w500,
  );
  HomeCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the Row with a SingleChildScrollView for horizontal scrolling
    return Container(
      // Add margin at the top and bottom
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 15,
        right: 15,
      ), // Adjust the values as needed
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20, //horizontal spacing between the children
          runSpacing: 15, //vertical spacing between the children
          children: [
            Column(
              children: [
                CategoryBox(
                  icon: FontAwesomeIcons.squareParking,
                ),
                Text(
                  "Parking",
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                CategoryBox(
                  icon: FontAwesomeIcons.bus,
                ),
                Text(
                  "Bus Route",
                  style: textStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
