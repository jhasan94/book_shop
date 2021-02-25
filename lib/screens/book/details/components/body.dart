import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/book/details/components/description.dart';
import 'package:book_shop/screens/book/details/components/product_title_with_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final title, authorName, img, des, price, pdfsize, id, pdfurl;

  const Body(
      {Key key,
      this.title,
      this.pdfurl,
      this.id,
      this.authorName,
      this.img,
      this.des,
      this.price,
      this.pdfsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.38),
                  padding: EdgeInsets.only(
                    top: size.height * 0.10,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  //height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: kDefaultPaddin),
                      Expanded(
                        child: Description(
                          des: des,
                        ),
                      ),
                      SizedBox(height: kDefaultPaddin / 2),
                      //CounterWithFavBtn(),
                      //SizedBox(height: kDefaultPaddin / 2),
                      //AddToCart(),
                    ],
                  ),
                ),
                ProductTitleWithImage(
                  pdfsize: pdfsize,
                  title: title,
                  img: img,
                  id: id,
                  authorName: authorName,
                  price: price,
                  pdfurl: pdfurl,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
