// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';

class Reply extends StatefulWidget {
  String name, time, content, id, twtId;
  var image;

  Reply({
    super.key,
    required this.name,
    required this.twtId,
    required this.id,
    required this.image,
    required this.time,
    required this.content,
  });

  @override
  ReplyState createState() => ReplyState();
}

class ReplyState extends State<Reply> {
  var imageBytes;

  @override
  void initState() {
    imageBytes = Uint8List.fromList(List<int>.from(widget.image));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 33, 47, 61),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, right: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
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
              padding: const EdgeInsets.only(top: 12, left: 7, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          //fontFamily: 'Roboto',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.content,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
