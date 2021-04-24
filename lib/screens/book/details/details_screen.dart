import 'package:book_shop/screens/book/details/components/body.dart';
import 'package:flutter/material.dart';

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
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
