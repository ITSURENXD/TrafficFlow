import 'package:flutter/material.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of items (Widgets) you want to display
    List<Widget> items = List.generate(
      10, // Number of items you want to generate
      (index) => Padding(
        padding: const EdgeInsets.all(8.0), // Adjust padding as needed
        child: Container(
          height: 200, // Specify a height
          width: 150, // and a width for each container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey,
          ),
        ),
      ),
    );

    return Wrap(
      spacing: 8.0, // Horizontal space between the containers
      runSpacing: 8.0, // Vertical space between the containers
      children: items,
    );
  }
}
