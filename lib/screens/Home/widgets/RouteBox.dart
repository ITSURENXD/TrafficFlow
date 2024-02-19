import 'package:flutter/material.dart';

class RouteBox extends StatefulWidget {
  const RouteBox({
    Key? key,
  }) : super(key: key);

  @override
  State<RouteBox> createState() => _RouteBox();
}

class _RouteBox extends State<RouteBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225, // Specify a height
      width: 155, // and a width for each container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.grey[350]!,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "lib/images/map.jpeg",
              width: 155,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              "Mulpani-Rnac",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(
            "2 available routes",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Est: 1hr",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "⭐ 4.8",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
