import 'package:book_shop/models/sizas_center_member_model/group_name.dart';
import 'package:book_shop/screens/sizas_center/components/group_list.dart';
import 'package:flutter/material.dart';

class GroupBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
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
                  itemCount: group.length,
                  itemBuilder: (context, index) => GroupList(
                        groupName: group[index],
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
