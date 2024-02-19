import 'package:flutter/material.dart';
import 'package:traffic_management/screens/Home/widgets/RouteBox.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of items (Widgets) you want to display
    List<Widget> items = List.generate(
      4, // Number of items you want to generate
      (index) => Padding(
        padding: const EdgeInsets.fromLTRB(
          8.0,
          15.0,
          8.0,
          10.0,
        ), // Adjust padding as needed
        child: RouteBox(),
      ),
    );

    return Wrap(
      spacing: 8.0, // Horizontal space between the containers
      runSpacing: 8.0, // Vertical space between the containers
      children: items,
    );
  }
}
