import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/article.dart';
import 'package:book_shop/screens/audio_book.dart';
import 'package:book_shop/screens/books/book_screen.dart';
import 'package:book_shop/screens/events/event_screen.dart';
import 'package:book_shop/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;

  List<Widget> listWidgets = [
    Body(),
    AudioBook(),
    TextBook(),
    Article(),
    EventScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: listWidgets[selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.book, title: 'Text Book'),
          TabItem(icon: Icons.audiotrack, title: 'Audio Book'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.article, title: 'Articles'),
          TabItem(icon: Icons.event, title: 'Events'),
          //TabItem(icon: Icons.event, title: 'Fan Club'),
        ],
        initialActiveIndex: selectedIndex, //optional, default as 0
        color: Colors.black,
        backgroundColor: Colors.amber,
        onTap: onItemTapped,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      title: Text(
        "Book Shop",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/back.svg"),
      //   onPressed: () {},
      // ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: SvgPicture.asset(
      //       "assets/icons/search.svg",
      //       // By default our  icon color is white
      //       color: kTextColor,
      //     ),
      //     onPressed: () {},
      //   ),
      //   IconButton(
      //     icon: SvgPicture.asset(
      //       "assets/icons/cart.svg",
      //       // By default our  icon color is white
      //       color: kTextColor,
      //     ),
      //     onPressed: () {},
      //   ),
      //   SizedBox(width: kDefaultPaddin / 2)
      // ],
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
