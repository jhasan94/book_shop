import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  String imgAssetPath;
  String eventType;
  EventTile({this.imgAssetPath, this.eventType});
//Color(0xff29404E)
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imgAssetPath,
            height: 27,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            eventType,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
