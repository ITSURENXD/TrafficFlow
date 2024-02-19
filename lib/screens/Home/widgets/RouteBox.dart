import 'package:flutter/material.dart';
import 'package:traffic_management/widgets/IndividualRoutePage.dart';

class RouteBox extends StatefulWidget {
  const RouteBox({
    Key? key,
  }) : super(key: key);

  @override
  State<RouteBox> createState() => _RouteBoxState();
}

class _RouteBoxState extends State<RouteBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Your onPressed functionality here
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => IndividualRoutePage()));
      },
      child: Container(
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
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                "Mulpani-Rnac",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "2 available routes",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
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
      ),
    );
  }
}
