import 'package:book_shop/constants.dart';
import 'package:book_shop/models/Book.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        book.description,
        textAlign: TextAlign.justify,
        style: TextStyle(
          height: 1.5,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
