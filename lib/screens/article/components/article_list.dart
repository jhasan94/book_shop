import 'package:book_shop/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  var articleTitle, imgUrl;
  final Function press;

  ArticleList({Key key, this.articleTitle, this.imgUrl, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 16),
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
                      articleTitle,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/events/calender.png",
                          height: 12,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "1/1/21",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: Api.imgDir + imgUrl,
                  // placeholder: (context, url) =>
                  //     Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                )
                // Image.network(
                //   Api.imgDir + imgUrl,
                //   height: 100,
                //   width: 120,
                //   fit: BoxFit.cover,
                // )
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
