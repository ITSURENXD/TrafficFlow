import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trafficflowdev/providers/user_provider.dart';
import 'package:trafficflowdev/screens/Login/LoginPage.dart';
import 'screens/Home/HomePage.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      // API Keys Removed
      options: const FirebaseOptions(
          apiKey: "API_KEY",
          authDomain: "AUTH_DOMAIN",
          projectId: "PROJECT_ID",
          storageBucket: "STORAGE_BUCKET",
          messagingSenderId: "ID",
          appId: "APP_ID"),
    );
  } else {
    await Firebase.initializeApp();
  }
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProvider(),)
      ],
      child: MaterialApp(
        title: "Traffic Flow",
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        // Seting Up Persistent Authentication
        home: StreamBuilder(
          stream: FirebaseAuth.instance
              .authStateChanges(), // runs only when user signs in or signs out
          builder: (context, snapshot) {
            // Connection Made State
            if (snapshot.connectionState == ConnectionState.active) {
              // Checks the connection with the stream from above
              if (snapshot.hasData) {
                // Checks if the user is Authenticated
                return const HomePage();
              } else if (snapshot.hasError) {
                return Center(
                    child:
                        Text('[ERR 101]: Corrupted snapshot: ${snapshot.error}'));
              }
            }
            // Connection Waiting State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              );
            }
            // If none of the above
            return const LoginPage();
          },
        ),
      ));
  }
}
