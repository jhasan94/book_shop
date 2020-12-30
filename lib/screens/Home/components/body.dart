import 'package:book_shop/models/Book.dart';
import 'package:book_shop/screens/Home/components/item_card.dart';
import 'package:book_shop/screens/Home/details/details_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              height: 196.5,
              width: double.infinity,
              child: Carousel(
                images: [
                  Image.asset(
                    "assets/images/coverphoto/islamic.jpg",
                    width: double.infinity,
                  ),
                  Image.asset(
                    "assets/images/coverphoto/islamicCover.jpg",
                    width: double.infinity,
                  ),
                  Image.asset(
                    "assets/images/coverphoto/islamic3.jpg",
                    width: double.infinity,
                  ),
                ],
                boxFit: BoxFit.fill,
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.amber,
                indicatorBgPadding: 3.0,
                //dotBgColor: Colors.purple.withOpacity(0.5),
                //borderRadius: true,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) => ItemCard(
                        book: books[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                //product: books[index],
                                book: books[index],
                              ),
                            )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
