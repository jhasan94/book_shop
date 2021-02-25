import 'package:book_shop/constants.dart';
import 'package:book_shop/screens/book/details/components/cart_counter.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.only(right: kDefaultPaddin),
          //   height: 50,
          //   width: 58,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(18),
          //     border: Border.all(
          //       color: product.color,
          //     ),
          //   ),
          //   child: IconButton(
          //     icon: SvgPicture.asset(
          //       "assets/icons/add_to_cart.svg",
          //       color: product.color,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          CartCounter(),
          SizedBox(
            width: kDefaultPaddin,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.red,
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
          ),
        ],
      ),
    );
  }
}
