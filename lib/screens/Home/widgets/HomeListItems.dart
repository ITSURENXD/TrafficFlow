import 'package:flutter/material.dart';
import 'package:trafficflowdev/screens/Home/widgets/RouteBox.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of items (Widgets) you want to display
    List<Widget> items = List.generate(
      4, // Number of items you want to generate
      (index) => const Padding(
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
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
