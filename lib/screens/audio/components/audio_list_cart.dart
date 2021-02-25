import 'package:book_shop/models/audio_model.dart';
import 'package:flutter/material.dart';

class AudioListCart extends StatelessWidget {
  final title, sizeAudioFile;
  final Function press;

  const AudioListCart({Key key, this.title, this.press, this.sizeAudioFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: Colors.white54,
        child: ListTile(
          leading: Icon(Icons.music_note),
          title: Text(title),
          trailing: RichText(
            text: TextSpan(
                text: "${sizeAudioFile.toStringAsFixed(2)} MB",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
