import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficflowdev/providers/user_provider.dart';
import 'package:trafficflowdev/screens/Home/widgets/CategoryBox.dart';
import 'package:trafficflowdev/screens/Home/widgets/HomeListItems.dart';
import 'package:trafficflowdev/screens/Home/widgets/HomeSearchBar.dart';
import '../../widgets/CustomBottomNavBar.dart';
import './widgets/HomeAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      drawer: const CategoryBox(),
      body: Column(
        children: [
          // Fixed part (non-scrollable)
          HomeSearchBar(),

          // Scrollable part
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Your scrollable content goes here
                  HomeListItems(),
                  // Add more widgets that you want to scroll
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
