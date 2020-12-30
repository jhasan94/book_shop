import 'package:book_shop/constants.dart';
import 'package:book_shop/models/Product.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Islamic Book",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.bookTitle,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            product.authorname,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin / 2),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Price\n",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent,
                        )),
                    TextSpan(
                      text: "TK ${product.price}\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough),
                    ),
                    TextSpan(
                      text: "TK ${product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin * 5),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                    height: 270,
                    //width: 70,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
