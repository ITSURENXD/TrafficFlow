import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traffic_management/screens/Home/widgets/HomeSearchBar.dart';
import '../../widgets/CustomBottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable defining the text style
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff131313),
        elevation: 0,
        leading: Icon(
          FontAwesomeIcons.bars,
          size: 18,
          color: Colors.grey[600],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(
              FontAwesomeIcons.userAstronaut,
              size: 18.0,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // location and text with the user profile

          // search-bar
          HomeSearchBar(),

          // horizontal list view
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
