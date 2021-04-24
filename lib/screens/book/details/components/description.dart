import 'package:book_shop/constants.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final des;

  const Description({Key key, this.des}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        des,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
