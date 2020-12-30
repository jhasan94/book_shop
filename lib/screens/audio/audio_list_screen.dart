import 'package:book_shop/models/audio_model.dart';
import 'package:book_shop/screens/audio/audio_list_cart.dart';
import 'package:book_shop/screens/audio/audio_screen.dart';
import 'package:flutter/material.dart';

class AudioListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            height: 196.5,
            width: double.infinity,
            child: Image.asset("assets/images/coverphoto/islamic.jpg"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: ListView.builder(
                  itemCount: audioModel.length,
                  itemBuilder: (context, index) => AudioListCart(
                        audioModel: audioModel[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AudioScreen(),
                            )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.amber,
    elevation: 0,
    title: Text(
      "Book Shop",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
