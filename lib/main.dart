import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traffic_management/screens/Login/LoginPage.dart';
import 'package:traffic_management/screens/Login/signuppage.dart';
import 'screens/Home/HomePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traffic Flow",
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
