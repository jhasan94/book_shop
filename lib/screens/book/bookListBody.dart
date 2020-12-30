import 'package:book_shop/models/Product.dart';
import 'package:book_shop/screens/book/components/item_card.dart';
import 'file:///D:/flutterProject/book_shop/lib/screens/book/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import 'components/categorries.dart';

class BookListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: kDefaultPaddin * 2,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.65,
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
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.amber,
    title: Text(
      "Book Shop",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/cart.svg"),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/profile.svg",
        ),
        onPressed: () {},
      ),
      SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}
