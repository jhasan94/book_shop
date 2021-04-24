import 'package:book_shop/api.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final id, img, title, author_name;
  final Function press;
  const ItemCard({
    Key key,
    this.img,
    this.title,
    this.id,
    this.author_name,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPaddin * 2),
      child: GestureDetector(
        onTap: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "${id}",
                child: Image.network(
                  Api.imgDir + img,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${author_name}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // Text(
            //   "TK ${product.price}",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //       decoration: TextDecoration.lineThrough),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   "TK ${product.discountPrice}",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // SizedBox(
            //   height: 40,
            //   width: 180,
            //   child: FlatButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15)),
            //     color: product.color,
            //     onPressed: () {},
            //     child: Text(
            //       "Add to Cart".toUpperCase(),
            //       style: TextStyle(
            //         fontSize: 17,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
