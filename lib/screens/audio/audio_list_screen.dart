import 'package:book_shop/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/audio_list_cart.dart';
import 'components/audio_page.dart';

class AudioListScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller());
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
                child: Obx(() {
                  if (controller.isLoading.value)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else
                    return RefreshIndicator(
                      onRefresh: () => controller.fetchAudio(),
                      child: ListView.builder(
                          itemCount: controller.audioList.first.data.length,
                          itemBuilder: (context, index) {
                            var audio = controller.audioList.first.data[index];
                            return AudioListCart(
                              sizeAudioFile: double.parse(audio.size) / 1000000,
                              title: audio.title,
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AudioPage(
                                      img: audio.coverPhoto,
                                      title: audio.title,
                                      audioUrl: audio.audioOrginal,
                                    ),
                                  )),
                            );
                          }),
                    );
                })),
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
      "Audio books",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
