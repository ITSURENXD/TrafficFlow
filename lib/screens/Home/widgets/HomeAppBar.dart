import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:traffic_management/screens/Home/widgets/HomeSearchBar.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff131313),
      pinned: true,
      expandedHeight: 250,
      toolbarHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isExpanded = constraints.biggest.height > 120;
            return AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: isExpanded ? 1.0 : 0.0,
              child: isExpanded ? HomeSearchBar() : Text("Hello"),
            );
          },
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xff131313),
                Color(0xff313131),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
