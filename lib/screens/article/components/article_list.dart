import 'package:book_shop/models/article_model.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  final Article article;
  final Function press;

  const ArticleList({Key key, this.article, this.press}) : super(key: key);
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
                      article.title,
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
                          article.date,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Image.asset(
                    //       "assets/images/events/location.png",
                    //       height: 12,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       address,
                    //       style: TextStyle(color: Colors.white, fontSize: 10),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                child: Image.asset(
                  article.img,
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                )),
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
