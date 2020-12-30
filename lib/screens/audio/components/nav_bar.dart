import 'package:book_shop/screens/audio/colors.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // NavBarItem(
          //   icon: Icons.arrow_back_ios,
          // ),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              'Playing Now',
              style: TextStyle(
                  fontSize: 20,
                  color: darkPrimaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // NavBarItem(
          //   icon: Icons.list,
          // )
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;

  const NavBarItem({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: darkPrimaryColor.withOpacity(0.5),
            offset: Offset(5, 10),
            spreadRadius: 3,
            blurRadius: 10),
        BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -4),
            spreadRadius: -2,
            blurRadius: 20)
      ], color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        icon: Icon(
          icon,
          color: darkPrimaryColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
