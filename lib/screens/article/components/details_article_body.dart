import 'package:book_shop/api.dart';
import 'package:book_shop/screens/article/components/description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsArticleBody extends StatelessWidget {
  var articleTitle, imgUrl, des;

  DetailsArticleBody({Key key, this.articleTitle, this.imgUrl, this.des})
      : super(key: key);
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
                      child: CachedNetworkImage(
                        imageUrl: Api.imgDir + imgUrl,
                        // placeholder: (context, url) =>
                        //     Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 100,
                        //width: 120,
                        fit: BoxFit.cover,
                      )
                      // Image.network(
                      //   Api.imgDir + imgUrl,
                      //   height: 100,
                      //   width: 120,
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articleTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Description(des: des)
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
