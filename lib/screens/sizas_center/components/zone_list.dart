import 'package:book_shop/models/sizas_center_member_model/zone.dart';
import 'package:flutter/material.dart';

class ZoneList extends StatelessWidget {
  final Zone zone;
  final Function press;

  const ZoneList({
    Key key,
    this.zone,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ListTile(
        leading: Icon(Icons.location_city),
        title: Text(zone.zoneName),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
