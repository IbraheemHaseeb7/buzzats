// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Replying.dart';
import 'package:flutter_app_1/pages/CommentSection.dart';

class TweetWidget extends StatefulWidget {
  String name, time, content, id;
  int likesCount, repliesCount;
  var image;
  TweetWidget(
      {super.key,
      required this.name,
      required this.id,
      required this.image,
      required this.time,
      required this.content,
      required this.repliesCount,
      required this.likesCount});

  @override
  _TweetWidget createState() => _TweetWidget();
}

class _TweetWidget extends State<TweetWidget> {
  bool isLiked = false;
  var imageBytes;

  @override
  void initState() {
    imageBytes = Uint8List.fromList(List<int>.from(widget.image));
    super.initState();
  }

  void handleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked == true) {
        ++widget.likesCount;
      } else {
        --widget.likesCount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      //used this so that if a user tap the tweet, it opens a new window showing only this tweet and the comments below
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentSection()),
        );
      },
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(0xFF141D26),
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2),
            //bottom: BorderSide(color: Colors.grey,width: 0.2)
          ),
        ),
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
                        width: 50,
                      )
                    : Image.memory(
                        imageBytes,
                        width: 50,
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
                  Container(
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
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            (() {
                              switch (widget.id) {
                                case "fa21bcs052":
                                case "fa21bcs140":
                                case "fa21bcs082":
                                  return Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.white,
                                        size: 17,
                                      ));
                                default:
                                  return Container();
                              }
                            })(),
                          ],
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 114, 114, 114),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    width: screenWidth - 100,
                    child: Text(
                      widget.content,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: handleLike,
                                  icon: Icon(
                                    !isLiked
                                        ? CupertinoIcons.heart
                                        : CupertinoIcons.heart_fill,
                                    color: !isLiked ? Colors.white : Colors.red,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.likesCount.toString(), //likessss
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) => Replying());
                                  },
                                  icon: Icon(
                                    CupertinoIcons.arrow_counterclockwise,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.repliesCount.toString(), //repliessssss
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
