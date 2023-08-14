import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/ImageOverlay.dart';

class SocietyTweetImage extends StatefulWidget {
  SocietyTweetImage({super.key});

  @override
  SocietyTweetImageState createState() => SocietyTweetImageState();
}

class SocietyTweetImageState extends State<SocietyTweetImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ImagePopup(image: Image.asset("lib/Assets/bg_tweet.jpeg"))
            .openImage(context);
      },
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(right: 20),
          width: 100,
          height: 150,
          // margin: const EdgeInsets.only(right: 15),
          child: Image.asset(
            "lib/Assets/bg_tweet.jpeg",
            fit: BoxFit.cover,
          )),
    );
  }
}
