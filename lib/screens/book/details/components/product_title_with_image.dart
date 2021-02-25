import 'package:book_shop/api.dart';
import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/book/details/pdf_viewer.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  final title, authorName, id, img, price, pdfsize, pdfurl;

  const ProductTitleWithImage(
      {Key key,
      this.title,
      this.pdfurl,
      this.authorName,
      this.pdfsize,
      this.price,
      this.id,
      this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Book Title",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            authorName,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfViewer(
                      pdfUrl: pdfurl,
                    ),
                  ));
            },
            child: Text(
              "Reading Book".toUpperCase(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
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
                    // TextSpan(
                    //   text: "TK ${product.price}\n",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //       fontSize: 18,
                    //       decoration: TextDecoration.lineThrough),
                    // ),
                    TextSpan(
                      text: "TK ${price}",
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
                child: Column(
                  children: [
                    Hero(
                      tag: "${id}",
                      child: Image.network(
                        Api.imgDir + img,
                        fit: BoxFit.fill,
                        height: 250,
                        //width: 70,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Size ${pdfsize.toStringAsFixed(2)} MB",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
