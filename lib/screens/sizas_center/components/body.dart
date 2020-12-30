import 'package:book_shop/models/sizas_center_member_model/zone.dart';
import 'package:book_shop/screens/sizas_center/components/group_body.dart';
import 'package:book_shop/screens/sizas_center/components/zone_list.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 196.5,
          width: double.infinity,
          child: Image.asset("assets/images/coverphoto/islamic.jpg"),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: ListView.builder(
                itemCount: zone.length,
                itemBuilder: (context, index) => ZoneList(
                      zone: zone[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroupBody(
                                //product: books[index],
                                ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
