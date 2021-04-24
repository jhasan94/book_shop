import 'package:book_shop/screens/Home/components/body.dart';
import 'package:flutter/material.dart';

class BookScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Body(),
      ),
    );
  }
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
