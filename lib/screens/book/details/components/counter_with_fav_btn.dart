import 'file:///D:/flutterProject/book_shop/lib/screens/book/details/components/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
      ],
    );
  }
}
