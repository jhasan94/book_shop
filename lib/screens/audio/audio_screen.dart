import 'file:///D:/flutterProject/book_shop/lib/screens/audio/components/album_art.dart';
import 'file:///D:/flutterProject/book_shop/lib/screens/audio/components/nav_bar.dart';
import 'file:///D:/flutterProject/book_shop/lib/screens/audio/components/player_controls.dart';
import 'package:book_shop/screens/audio/audio_provider/audio_player.dart';
import 'package:book_shop/screens/audio/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  double sliderValue = 2;

  Map audioData = {
    'image':
        'https://thegrowingdeveloper.org/thumbs/1000x1000r/audios/quiet-time-photo.jpg',
    'url':
        'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NavigationBar(),
          Container(
            margin: EdgeInsets.only(left: 70),
            height: height / 3,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            'Audio Book',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: darkPrimaryColor),
          ),
          Text(
            'About Siddik nagori',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: darkPrimaryColor),
          ),
          // Column(
          //   children: [
          //     SliderTheme(
          //       data: SliderThemeData(
          //           trackHeight: 5,
          //           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
          //       child: Consumer<MyAudio>(
          //         builder: (_, myAudioModel, child) => Slider(
          //           value: myAudioModel.position == null
          //               ? 0
          //               : myAudioModel.position.inMilliseconds.toDouble(),
          //           activeColor: darkPrimaryColor,
          //           inactiveColor: darkPrimaryColor.withOpacity(0.3),
          //           onChanged: (value) {
          //             myAudioModel
          //                 .seekAudio(Duration(milliseconds: value.toInt()));
          //           },
          //           min: 0,
          //           max: myAudioModel.totalDuration == null
          //               ? 20
          //               : myAudioModel.totalDuration.inMilliseconds.toDouble(),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          //PlayerControls(),
          SizedBox(
            height: 50,
          )
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
      "Siddiknogori",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
