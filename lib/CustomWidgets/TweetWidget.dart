// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Replying.dart';
import 'package:flutter_app_1/pages/CommentSection.dart';

class TweetWidget extends StatefulWidget {
  TweetWidget({super.key});

  @override
  _TweetWidget createState() => _TweetWidget();
}

class _TweetWidget extends State<TweetWidget> {
  bool isLiked = false;

  void handleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      //used this so that if a user tap the tweet, it opens a new window showing only this tweet and the comments below
      onTap: () {
          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommentSection()),
                      );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF141D26),
          // borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(30),
          //       bottomRight: Radius.circular(30),
          //       topLeft: Radius.zero, // Set the top left radius to zero
          //       topRight: Radius.zero, // Set the top right radius to zero
          //     ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: Image.asset(
                  "lib\\Assets\\abdu.jpg",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abdullah Sajjad",
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
                          Icons.verified,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    width: screenWidth - 100,
                    child: Text(
                      "haskdhfkjashdkfhashlkahflkashflkashflkhasdfhkasdhflkhsdlkfhaskhflkshflkashfweoerf;afvldhnf;iasdklfcbkfdiufhdslfashdfkhl",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 8),
                    child: Column(
                      children: [
                        Row(
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
                            IconButton(
                              onPressed: (){
                                showModalBottomSheet(
                                  backgroundColor:  Colors.transparent,
                                  context: context,
                                   builder: (context)=> Replying()
                                   );
                                   },
                              icon: Icon(
                                CupertinoIcons.arrow_counterclockwise,
                                color: Colors.white,
                              ),
                              color: Colors.white,
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "20 likes",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "4 replies",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
