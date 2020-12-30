import 'package:book_shop/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.bookTitle,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "${product.authorname}",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "TK ${product.price}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "TK ${product.discountPrice}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 40,
            width: 180,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: product.color,
              onPressed: () {},
              child: Text(
                "Add to Cart".toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
