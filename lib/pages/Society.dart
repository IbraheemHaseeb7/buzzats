import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyTweet.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';

class Society extends StatefulWidget {
  Society({super.key});

  @override
  SocietyState createState() => SocietyState();
}

class SocietyState extends State<Society> {
  final String societyName = "IEEE Ras";
  final String followers = "200";
  final String mututals = "12";
  final String descriptions = "lorem ipus dolar...";
  final String president = "Bilawal Bhutto";
  Color tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
  Color groupButtonColor = const Color(0xff141D26);
  bool isTweetsDisplayed = true;

  void handleFollow() {}

  void handleApply() {}

  void handleTweet() {
    setState(() {
      tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
      groupButtonColor = const Color(0xff141D26);
      isTweetsDisplayed = true;
    });
  }

  void handleGroup() {
    setState(() {
      groupButtonColor = const Color.fromARGB(66, 96, 128, 167);
      tweetButtonColor = const Color(0xff141D26);
      isTweetsDisplayed = false;
    });
  }

  Future<void> handleRefresh() async {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
          onRefresh: handleRefresh,
          child: Container(
              padding: const EdgeInsets.only(top: 50),
              color: Color(0xff141D26),
              width: screenWidth,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35,
                      child:
                          ClipOval(child: Image.asset("lib/assets/ieee.jpg"))),
                  Text(
                    societyName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              followers,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            const Text(
                              "followers",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              mututals,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            const Text(
                              "mutuals",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    width: screenWidth * 0.7,
                    child: Text(
                      descriptions,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xff6080A7),
                          decoration: TextDecoration.none,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: screenWidth,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 35,
                              width: screenWidth * 0.4,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                              color: Color(0xff6080A7),
                                              width: 2.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xff141D26))),
                                  onPressed: handleFollow,
                                  child: const Text("follow"))),
                          Container(
                              height: 35,
                              width: screenWidth * 0.4,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                              color: Color(0xff6080A7),
                                              width: 2.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xff141D26))),
                                  onPressed: handleApply,
                                  child: const Text("apply"))),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      "President: $president",
                      style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: screenWidth,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        border:
                            Border(top: BorderSide(color: Color(0xff6080A7)))),
                  ),
                  Container(
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
                                  groupButtonColor)),
                          onPressed: handleGroup,
                          child: const Text(
                            "Groups",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ]),
                  ),
                  (() {
                    if (isTweetsDisplayed) {
                      return Container(
                        width: screenWidth,
                        child: Column(children: [
                          SocietyTweet(),
                          SocietyTweet(),
                          SocietyTweet(),
                          SocietyTweet(),
                        ]),
                      );
                    } else {
                      return Container(
                          width: screenWidth,
                          child: Column(children: [
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                          ]));
                    }
                  })(),
                ],
              )))),
    );
  }
}
