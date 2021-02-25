import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.des,
  }) : super(key: key);

  final des;

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
