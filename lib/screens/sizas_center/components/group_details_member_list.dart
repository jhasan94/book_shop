import 'package:book_shop/constants.dart';
import 'package:book_shop/models/sizas_center_member_model/member.dart';
import 'package:flutter/material.dart';

class GroupDetailsMemberList extends StatelessWidget {
  final Member member;

  const GroupDetailsMemberList({Key key, this.member}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        margin: EdgeInsets.all(kDefaultPaddin / 2),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16),
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      member.name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "address : " + member.address,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Contact no : " + member.contactNo,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: kDefaultPaddin),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/events/avatar.jpg",
                    height: 60,
                    width: 60,
                  )),
            ),
          ],
        ),
      ),

      // ListTile(
      //   leading: Icon(Icons.location_city),
      //   title: Text(article.title),
      //   trailing: Icon(Icons.keyboard_arrow_right),
      // ),
    );
  }
}
