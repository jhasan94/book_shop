import 'package:book_shop/controllers/controller.dart';
import 'package:book_shop/screens/Home/components/item_card.dart';
import 'package:book_shop/screens/Home/details_page/details_screen.dart';
import 'package:book_shop/size_config.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Controller controller = Get.put(Controller());
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
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical * 25,
            width: double.infinity,
            child: VideoPlayer(_controller),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return ListView.builder(
                  itemCount: controller.homePageList.first.data.length,
                  itemBuilder: (context, index) {
                    var homePage = controller.homePageList.first.data[index];
                    return ItemCard(
                      coverImg: homePage.image,
                      title: homePage.title,
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              title: homePage.title,
                              img: homePage.image,
                              des: homePage.details,
                            ),
                          )),
                    );
                  },
                );
            }),
          )
        ],
      ),
    );
  }
}
