import 'package:book_shop/models/sizas_center_member_model/group_name.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  final GroupName groupName;
  final Function press;

  const GroupList({Key key, this.groupName, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ListTile(
        leading: Icon(Icons.group),
        title: Text(groupName.groupName),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
