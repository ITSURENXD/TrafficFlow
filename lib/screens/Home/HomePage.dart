import 'package:flutter/material.dart';
import 'package:traffic_management/screens/Home/widgets/HomeCategory.dart';
import 'package:traffic_management/screens/Home/widgets/HomeListItems.dart';
import 'package:traffic_management/screens/Home/widgets/HomeSearchBar.dart';
import '../../widgets/CustomBottomNavBar.dart';
import './widgets/HomeAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          // Fixed part (non-scrollable)
          HomeSearchBar(),

          // Scrollable part
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Your scrollable content goes here
                  // category section
                  HomeCategory(),

                  HomeListItems(),
                  // Add more widgets that you want to scroll
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
