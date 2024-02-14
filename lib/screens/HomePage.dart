import "package:flutter/material.dart";
import '../widgets/CustomBottomNavBar.dart';

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
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Google Nav Bar")),
            body: Center(
              child: Text(
                "Hello Guys",
                style: TextStyle(fontSize: 24, color: Colors.purple),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar()));
  }
}
