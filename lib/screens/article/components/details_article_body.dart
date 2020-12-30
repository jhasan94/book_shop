import 'file:///D:/flutterProject/book_shop/lib/screens/article/components/description.dart';
import 'package:book_shop/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsArticleBody extends StatelessWidget {
  final Article article;

  const DetailsArticleBody({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 196.5,
                    //width: double.infinity,
                    child: Image.asset(article.img),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Description(article: article)
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    //toolbarHeight: 15,
    backgroundColor: Colors.black12,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        color: Colors.black,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
