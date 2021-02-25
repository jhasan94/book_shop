import 'package:book_shop/controllers/controller.dart';
import 'package:book_shop/screens/events/components/categorries.dart';
import 'package:book_shop/screens/events/components/popular_eventTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black54),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "EVE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "NTS",
                          style: TextStyle(
                              color: Color(0xffFCCD00),
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Color(0xffFAE072)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/images/events/jahid.jpg",
                            height: 30,
                            width: 30,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hello From Book Shop",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Let's explore what’s happening today",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),

                /// Popular Events
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Popular Events",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Categories(),
                // SizedBox(
                //   height: 16,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
