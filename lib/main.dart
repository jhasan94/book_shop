import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/logiInRegister/welcomePage.dart';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/coverphoto/appicon.jpg"),
        nextScreen: WelcomePage(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
      ),
    );
  }
}
// ChangeNotifierProvider(
// create: (_) => MyAudio(), child:
