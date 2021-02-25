import 'package:book_shop/models/article_model.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  var des;

  Description({Key key, this.des}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        des,
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
