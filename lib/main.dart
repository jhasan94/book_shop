import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/audio/audio_provider/audio_player.dart';
import 'package:book_shop/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home:
          ChangeNotifierProvider(create: (_) => MyAudio(), child: HomeScreen()),
    );
  }
}
