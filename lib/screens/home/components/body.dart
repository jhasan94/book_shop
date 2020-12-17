import 'package:book_shop/models/Product.dart';
import 'package:book_shop/screens/details/details_screen.dart';
import 'package:book_shop/screens/home/components/item_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'categorries.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 110),
        //   child: Text(
        //     "Book Shop",
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline5
        //         .copyWith(fontWeight: FontWeight.bold),
        //   ),
        // ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}