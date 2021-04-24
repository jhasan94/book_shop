import 'package:book_shop/constants.dart';
import 'package:book_shop/models/sizas_center_member_model/member.dart' as m;
import 'package:book_shop/models/sizas_center_model.dart';
import 'package:book_shop/screens/sizas_center/components/group_details_member_list.dart';
import 'package:flutter/material.dart';

class GroupDetailsBody extends StatelessWidget {
  List<Member> memberDetails;
  GroupDetailsBody({Key key, this.memberDetails}) : super(key: key);
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
                  itemCount: memberDetails.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.all(kDefaultPaddin / 2),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(8)),
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
                                      memberDetails[index].name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "address : " + memberDetails[index].email,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Contact no : " +
                                          memberDetails[index].mobile,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
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
                  }),
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
