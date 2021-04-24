import 'package:book_shop/constants.dart';
import 'package:book_shop/controllers/controller.dart';
import 'package:book_shop/screens/article/components/article_list.dart';
import 'package:book_shop/screens/article/components/details_article_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleBody extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPaddin / 2, vertical: kDefaultPaddin),
              child: Obx(() {
                if (controller.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return RefreshIndicator(
                    onRefresh: () => controller.fetchArticle(),
                    child: ListView.builder(
                      itemCount: controller.articleList.first.data.length,
                      itemBuilder: (context, index) {
                        var article = controller.articleList.first.data[index];
                        return ArticleList(
                          articleTitle: article.title,
                          imgUrl: article.image,
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsArticleBody(
                                  articleTitle: article.title,
                                  imgUrl: article.image,
                                  des: article.details,
                                ),
                              )),
                        );
                      },
                    ),
                  );
              })),
        ),
      ],
    );
  }
}
