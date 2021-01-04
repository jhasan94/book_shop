import 'package:book_shop/constants.dart';
import 'package:book_shop/models/sizas_center_member_model/member.dart';
import 'package:book_shop/screens/sizas_center/components/group_details_member_list.dart';
import 'package:flutter/material.dart';

class GroupDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.lime),
            padding: EdgeInsets.all(kDefaultPaddin),
            height: 196.5,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Siddiknogor Jaker Songothon ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Dhaka Division",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Address and Phone number will be here",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: ListView.builder(
                  itemCount: member.length,
                  itemBuilder: (context, index) => GroupDetailsMemberList(
                        member: member[index],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.amber,
    elevation: 0,
    title: Text(
      "Sizas Center",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
