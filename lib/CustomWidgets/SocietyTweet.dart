// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyTweetImage.dart';
import 'package:iconly/iconly.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';


class SocietyTweet extends StatefulWidget {
  String name, tweet, twtId;
  List<Image> tweetImage;
  bool isLiked;
  int likesCount;
  var image;
  SocietyTweet({
    super.key,
    required this.name,
    required this.tweet,
    //required this.time,
    required this.twtId,
    required this.image,
    required this.tweetImage,
    required this.isLiked,
    required this.likesCount,
  });

  @override
  _SocietyTweet createState() => _SocietyTweet();
}

class _SocietyTweet extends State<SocietyTweet> {
  bool isLiked = false;
  var imageBytes;

  @override
  void initState() {
    UserData();

    if (widget.image != null) {
      imageBytes = Uint8List.fromList(List<int>.from(widget.image));
    }

    super.initState();

    setState(() {
      isLiked = widget.isLiked;
    });
  }

  Future<void> handleLike() async {
    String queryStatement;
    if (!isLiked) {
      queryStatement =
          "INSERT INTO STweetsLike VALUES ('${widget.twtId}', '${UserData.id}', GETDATE())";
      setState(() {
        ++widget.likesCount;
        isLiked = !isLiked;
      });
    } else {
      queryStatement =
          "DELETE FROM STweetsLike WHERE STweetID = '${widget.twtId}' AND UserID = '${UserData.id}'";
      setState(() {
        --widget.likesCount;
        isLiked = !isLiked;
      });
    }

    await socketQuery(queryStatement).then((value) {}).catchError((err) {
      ToastMe(text: "Error occurred!", type: ToasterType.Error)
          .showToast(context);
      if (isLiked) {
        setState(() {
          --widget.likesCount;
          isLiked = false;
        });
      } else {
        setState(() {
          ++widget.likesCount;
          isLiked = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      //used this so that if a user tap the tweet, it opens a new window showing only this tweet and the comments below
      onTap: () {},
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
            color: Color(0xFF141D26),
            border: Border(bottom: BorderSide(color: const Color(0xff6080A7)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: widget.image == null
                    ? Image.asset(
                        "lib/Assets/profile.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                      )
                    : Image.memory(
                        imageBytes,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            //the username is wrapped in a column as we need a tweet just aligned below the username
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth - 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                IconlyBold.user_2,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        //  Text(
                        //   widget.time,
                        //   style: TextStyle(
                        //       color: const Color.fromARGB(255, 114, 114, 114),
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w600),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    width: screenWidth - 100,
                    child: Text(
                      widget.tweet,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  widget.tweetImage.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: screenWidth - 100,
                          height:
                              150, // Set the desired height of the container
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              widget.tweetImage
                                  .length, // Replace with the actual number of images you have
                              (index) => SocietyTweetImage(
                                  image: widget.tweetImage[index]),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: handleLike,
                                  icon: Icon(
                                    isLiked
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: isLiked ? Colors.red : Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.likesCount.toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
