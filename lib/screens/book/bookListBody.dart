import 'package:book_shop/controllers/controller.dart';
import 'package:book_shop/models/e_book_model.dart';
import 'package:book_shop/screens/book/components/item_card.dart';
import 'file:///D:/flutterProject/book_shop/lib/screens/book/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookListBody extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white54,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/coverphoto/back.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Obx(() {
                    if (controller.isLoading.value)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return RefreshIndicator(
                        onRefresh: () => controller.fetchEBook(),
                        child: GridView.builder(
                            itemCount: controller.eBookList.first.data.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 0.85,
                            ),
                            itemBuilder: (context, index) {
                              var eBook =
                                  controller.eBookList.first.data[index];
                              var a = eBook.size / 1000000;
                              return ItemCard(
                                id: eBook.id,
                                img: eBook.coverPhoto,
                                title: eBook.title,
                                author_name: eBook.author,
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen1(
                                        size: (eBook.size / 1000000),
                                        price: eBook.price,
                                        des: eBook.description,
                                        title: eBook.title,
                                        img: eBook.coverPhoto,
                                        id: eBook.id,
                                        authorname: eBook.author,
                                        pdfurl: eBook.file,
                                      ),
                                    )),
                              );
                            }),
                      );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.amber,
    title: Text(
      "Book Shop",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevation: 0,
  );
}
