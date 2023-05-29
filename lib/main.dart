import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'Widgets/check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body:
          SplashScreenView(
            navigateRoute: Check(),
            duration: 4000,
            imageSize: 200,
            imageSrc: "Assets/images/splash.png",
            backgroundColor: Colors.blue[500],
            text: 'Welcome to NAS',textStyle:TextStyle(fontSize: 30,color: Colors.amber[300]),
          ),
        )
    );
  }
}