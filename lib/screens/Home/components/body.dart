import 'package:book_shop/models/Book.dart';
import 'package:book_shop/screens/Home/components/item_card.dart';
import 'package:book_shop/screens/Home/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/images/coverphoto/Siddiknogori_Logo_Animation.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 196.5,
            width: double.infinity,
            child: VideoPlayer(_controller),
            // Carousel(
            //   images: [
            //     Image.asset(
            //       "assets/images/coverphoto/islamic.jpg",
            //       width: double.infinity,
            //     ),
            //     Image.asset(
            //       "assets/images/coverphoto/islamicCover.jpg",
            //       width: double.infinity,
            //     ),
            //     Image.asset(
            //       "assets/images/coverphoto/islamic3.jpg",
            //       width: double.infinity,
            //     ),
            //   ],
            //   boxFit: BoxFit.fill,
            //   dotSize: 4.0,
            //   dotSpacing: 15.0,
            //   dotColor: Colors.amber,
            //   indicatorBgPadding: 3.0,
            //   //dotBgColor: Colors.purple.withOpacity(0.5),
            //   //borderRadius: true,
            // )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) => ItemCard(
                        book: books[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                //product: books[index],
                                book: books[index],
                              ),
                            )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
