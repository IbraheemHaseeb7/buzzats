// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/pages/EditProfile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
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

  @override
  Widget build(BuildContext context) {
    //screenheight and width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                            Text(
                              'Abdullah Sajjad',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.verified_rounded, color: Colors.blue)
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: screenWidth - 200,
                          child: Text(
                            "I told you long ago, wanna roll, i will kill you for god sake I told you long ago, wanna roll, i will kill you for god sake",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Add padding to create space around the texts

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "200",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add some space between the texts
                                    Text(
                                      "Connections",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Add padding to create space around the texts
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "7",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            4), // Add some space between the texts
                                    Text(
                                      "Mutuals",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          child: Image.asset(
                            "lib\\Assets\\abdu.jpg",
                            width: 90,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProfile(), // Replace with the screen you want to navigate to
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            fixedSize: MaterialStatePropertyAll(Size(80, 10)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        // Set the shape property to a RoundedRectangleBorder
                        borderRadius: BorderRadius.circular(
                            16), // Set your desired corner radius
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "More details",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          CupertinoIcons.app,
                          color: Colors.white,
                        ),
                        backgroundColor: Color(0xFF4137BD),
                        children: [
                          Column(
                            // Wrap the children with a Column
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align children to the left
                            children: [
                              Text(
                                "Registration Number: FA21-BCS-082",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Batch: Fall 2021",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Semester: 5th",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Department: Computer Science",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),

              Container(
                margin: const EdgeInsets.only(top: 15),
                width: screenWidth,
                child: Row(children: [
                  Container(
                    height: 40,
                    width: screenWidth * 0.5,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              tweetButtonColor)),
                      onPressed: handleTweet,
                      child: const Text(
                        "Tweets",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: screenWidth * 0.5,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              replierButtonColor)),
                      onPressed: handleReplies,
                      child: const Text(
                        "Replies",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ]),
              ),

              //TWEETS SECTION/ REPLIES SECTION
              Column(
                children: [
                  TweetWidget(),
                  TweetWidget(),
                  TweetWidget(),
                  TweetWidget(),
                  TweetWidget(),
                  TweetWidget(),
                  TweetWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
