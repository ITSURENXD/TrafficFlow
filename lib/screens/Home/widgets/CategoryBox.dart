import 'package:flutter/material.dart';

class CategoryBox extends StatefulWidget {
  final IconData icon; //variable for icon
  const CategoryBox({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  bool _isClicked = false;

  void _toggleClick() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleClick, // e tap event with ripple effect
      child: Ink(
        // Use Ink widget for custom Container decoration with ripple
        width: 50, // Specify the width here
        height: 50, // Specify the height here
        child: Center(
          child: Icon(
            widget.icon,
            size: 35,
            color: Color(0xffc67c4e),
          ),
        ),
      ),
    );
  }
}
