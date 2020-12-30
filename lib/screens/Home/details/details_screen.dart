import 'package:book_shop/constants.dart';
import 'package:book_shop/models/Book.dart';
import 'package:book_shop/screens/Home/details/components/description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Details extends StatelessWidget {
  final Book book;

  const Details({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    //Size size = MediaQuery.of(context).size;
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
                    child: Image.asset(book.desImage),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  book.desTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Description(book: book)
            ],
          ),
        ),
      ),
    );
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
}
