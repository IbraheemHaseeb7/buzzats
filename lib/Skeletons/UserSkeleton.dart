// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:flutter_app_1/pages/EditProfile.dart';
import 'package:shimmer/shimmer.dart';

class UserSkeleton extends StatefulWidget {
  @override
  createState() => UserSkeletonState();
}

class UserSkeletonState extends State<UserSkeleton> {
  Color tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
  Color replierButtonColor = const Color(0xff141D26);
  bool isTweetsDisplayed = true;

  void handleTweet() {
    setState(() {
      tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
      replierButtonColor = const Color(0xff141D26);
      isTweetsDisplayed = true;
    });
  }

  void handleReplies() {
    setState(() {
      replierButtonColor = const Color.fromARGB(66, 96, 128, 167);
      tweetButtonColor = const Color(0xff141D26);
      isTweetsDisplayed = false;
    });
  }

  Column generateButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute(
                builder: (context) =>
                    EditProfile(), // Replace with the screen you want to navigate to
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFF5F80A6)),
            foregroundColor: MaterialStatePropertyAll(Colors.transparent),
            fixedSize: MaterialStatePropertyAll(Size(80, 10)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
          ),
          child: Text(
            "Edit",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //screenheight and width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF141D26),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(color: Color(0xFF141D26)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Color(0xFF2E3D4C),
                              highlightColor: Colors.white.withOpacity(0.5),
                              child: Container(
                                width: 100,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF2E3D4C),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12, right: 5),
                              child: Shimmer.fromColors(
                                baseColor: Color(0xFF2E3D4C),
                                highlightColor: Colors.white.withOpacity(0.5),
                                child: Container(
                                  width: 50,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF2E3D4C),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 15), // Add some space between the texts

                            Padding(
                              padding:
                                  EdgeInsets.only(top: 12, left: 12, right: 5),
                              child: Shimmer.fromColors(
                                baseColor: Color(0xFF2E3D4C),
                                highlightColor: Colors.white.withOpacity(0.5),
                                child: Container(
                                  width: 50,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF2E3D4C),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Shimmer.fromColors(
                            baseColor: Color(0xFF2E3D4C),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: screenWidth - 200,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF2E3D4C),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Shimmer.fromColors(
                            baseColor: Color(0xFF2E3D4C),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: screenWidth - 200,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF2E3D4C),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Shimmer.fromColors(
                            baseColor: Color(0xFF2E3D4C),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: screenWidth - 200,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF2E3D4C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 4, left: 4, right: 4),
                            child: Shimmer.fromColors(
                              baseColor: Color(0xFF2E3D4C),
                              highlightColor: Colors.white.withOpacity(0.5),
                              child: Container(
                                width: 90,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2E3D4C),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        //generateButtons()
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),

              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, top: 2, left: 16, right: 16),
                child: Container(
                  padding: EdgeInsets.only(left: 11, top: 4),
                  width: screenWidth,
                  height: screenHeight - 730,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFF2E3D4C),
                          highlightColor: Colors.white.withOpacity(0.5),
                          child: Container(
                            width: screenWidth - 103,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF2E3D4C),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFF2E3D4C),
                          highlightColor: Colors.white.withOpacity(0.5),
                          child: Container(
                            width: screenWidth - 103,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF2E3D4C),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFF2E3D4C),
                          highlightColor: Colors.white.withOpacity(0.5),
                          child: Container(
                            width: screenWidth - 200,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF2E3D4C),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.only(top: 10),
                width: screenWidth,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          bottom: 20,
                        ),
                        child: Container(
                          height: 30,
                          width: screenWidth * 0.3,
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        tweetButtonColor)),
                            onPressed: handleTweet,
                            child: const Text(
                              "Tweets",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5, bottom: 20),
                        child: Container(
                          height: 30,
                          width: screenWidth * 0.3,
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        replierButtonColor)),
                            onPressed: handleReplies,
                            child: const Text(
                              "Replies",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),

              //TWEETS SECTION/ REPLIES SECTION
              Column(
                children: [
                  TweetSkeleton(),
                  TweetSkeleton(),
                  TweetSkeleton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
