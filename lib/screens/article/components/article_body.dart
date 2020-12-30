import 'file:///D:/flutterProject/book_shop/lib/screens/article/components/article_list.dart';
import 'file:///D:/flutterProject/book_shop/lib/screens/article/components/details_article_body.dart';
import 'package:book_shop/constants.dart';
import 'package:book_shop/models/article_model.dart';
import 'package:flutter/material.dart';

class ArticleBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPaddin / 2, vertical: kDefaultPaddin),
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) => ArticleList(
                      article: articles[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsArticleBody(
                              //product: books[index],
                              article: articles[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
