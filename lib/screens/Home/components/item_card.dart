import 'package:book_shop/models/Book.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Book book;
  final Function press;
  const ItemCard({
    Key key,
    this.book,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Image.asset(
          book.coverImage,
          fit: BoxFit.cover,
        ),
        Text(
          book.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
      ]),
    );
  }
}
