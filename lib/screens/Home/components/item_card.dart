import 'package:book_shop/api.dart';
import 'package:book_shop/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final coverImg, title;
  final Function press;
  const ItemCard({
    Key key,
    this.coverImg,
    this.title,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: press,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        // Image.network(
        //   Api.imgDir + coverImg,
        //   fit: BoxFit.cover,
        //   height: SizeConfig.blockSizeVertical * 25,
        //   width: double.infinity,
        // ),
        CachedNetworkImage(
          imageUrl: Api.imgDir + coverImg,
          // placeholder: (context, url) =>
          //     Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: SizeConfig.blockSizeVertical * 25,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // Image.asset(
        //   //book.coverImage,
        //   fit: BoxFit.cover,
        //   height: SizeConfig.blockSizeVertical * 25,
        //   width: double.infinity,
        // ),
        Text(
          title,
          style: TextStyle(
              color: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
              fontSize: 22.0),
        ),
      ]),
    );
  }
}
