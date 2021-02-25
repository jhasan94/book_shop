import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/book/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen1 extends StatelessWidget {
  final id, title, img, des, price, size, authorname, pdfurl;

  const DetailsScreen1(
      {Key key,
      this.id,
      this.title,
      this.pdfurl,
      this.img,
      this.des,
      this.price,
      this.size,
      this.authorname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.blueGrey,
      appBar: buildAppBar(context),
      body: Body(
        authorName: authorname,
        id: id,
        img: img,
        title: title,
        des: des,
        price: price,
        pdfsize: size,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: SvgPicture.asset("assets/icons/cart.svg"),
      //     onPressed: () {},
      //   ),
      //   IconButton(
      //     icon: SvgPicture.asset(
      //       "assets/icons/profile.svg",
      //     ),
      //     onPressed: () {},
      //   ),
      //   SizedBox(width: kDefaultPaddin / 2)
      // ],
    );
  }
}
