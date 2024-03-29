import 'package:book_shop/models/article_model.dart';
import 'package:book_shop/models/home_page_model.dart';
import 'package:book_shop/screens/Home/book_screen_home.dart';
import 'package:book_shop/screens/article/article_screen.dart';
import 'package:book_shop/screens/audio/audio_list_screen.dart';
import 'package:book_shop/screens/book/bookListBody.dart';
import 'package:book_shop/screens/events/event_screen.dart';
import 'package:book_shop/screens/sizas_center/sizas_center_home.dart';
import 'package:book_shop/services/article_api_manager.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> listWidgets = [
    BookScreenHome(),
    BookListBody(),
    AudioListScreen(),
    SizasCenter(),
    EventScreen(),
    ArticleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(),
      body: listWidgets[selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.book, title: 'Book'),
          TabItem(icon: Icons.audiotrack, title: 'Audio'),
          TabItem(icon: Icons.group, title: 'Center'),
          TabItem(icon: Icons.event, title: 'Events'),
          TabItem(icon: Icons.article, title: 'Article'),
        ],
        initialActiveIndex: selectedIndex, //optional, default as 0
        color: Colors.black,
        backgroundColor: Colors.amber,
        onTap: onItemTapped,
        height: 50,
        top: 0,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      title: Text(
        "Siddiknogori",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
