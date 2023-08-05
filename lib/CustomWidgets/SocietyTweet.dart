// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyTweetImage.dart';

class SocietyTweet extends StatefulWidget {
  SocietyTweet({super.key});

  @override
  _SocietyTweet createState() => _SocietyTweet();
}

class _SocietyTweet extends State<SocietyTweet> {
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
                      "haskdhfkjashdkahsdjfhlkajshdfklhakdhfklahsdcbahebclkhagsdufasdbfiuahewfbalshgfduiawelfkhasiudfhisadfiwgeflbasfhiwenfaueiwgfljsadhflashdfkljasdkhfjfhash",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: screenWidth - 100,
                    height: 150, // Set the desired height of the container
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SocietyTweetImage(),
                        SocietyTweetImage(),
                        SocietyTweetImage(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
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
                              onPressed: null,
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
