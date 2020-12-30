import 'package:book_shop/models/audio_model.dart';
import 'package:flutter/material.dart';

class AudioListCart extends StatelessWidget {
  final AudioModel audioModel;
  final Function press;

  const AudioListCart({Key key, this.audioModel, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: Colors.white54,
        child: ListTile(
          leading: Icon(Icons.music_note),
          title: Text(audioModel.title),
          trailing: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
