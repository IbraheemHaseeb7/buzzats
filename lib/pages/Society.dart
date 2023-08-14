import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Groups.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyGroupsContainer.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMember.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMembersContainer.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMutualsContainer.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMutual.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyTweet.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/pages/Apply.dart';
import 'package:flutter_app_1/pages/ManageSociety.dart';

class Society extends StatefulWidget {
  Map<String, dynamic> society;
  Society({super.key, required this.society});

  @override
  SocietyState createState() => SocietyState();
}

enum Displayed { tweets, groups, mutuals, members }

class SocietyState extends State<Society> {
  Color tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
  Color groupButtonColor = const Color(0xff141D26);
  Color mutualsButtonColor = const Color(0xff141D26);
  Color membersButtonColor = const Color(0xff141D26);
  Displayed displayed = Displayed.tweets;

  final bool isPresident = true;

  void handleFollow() {
    List temp = widget.society["groups"].map((e) {
      return Groups(
        group: e,
      );
    }).toList();
  }

  void handleApply() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (b) => Apply(
                  society: widget.society,
                )));
  }

  void handleTweet() {
    setState(() {
      tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
      groupButtonColor = const Color(0xff141D26);
      mutualsButtonColor = const Color(0xff141D26);
      membersButtonColor = const Color(0xff141D26);
      displayed = Displayed.tweets;
    });
  }

  void handleGroup() {
    setState(() {
      groupButtonColor = const Color.fromARGB(66, 96, 128, 167);
      tweetButtonColor = const Color(0xff141D26);
      mutualsButtonColor = const Color(0xff141D26);
      membersButtonColor = const Color(0xff141D26);
      displayed = Displayed.groups;
    });
  }

  void handleMutuals() {
    setState(() {
      mutualsButtonColor = const Color.fromARGB(66, 96, 128, 167);
      groupButtonColor = const Color(0xff141D26);
      tweetButtonColor = const Color(0xff141D26);
      membersButtonColor = const Color(0xff141D26);
      displayed = Displayed.mutuals;
    });
  }

  void handleMembers() {
    setState(() {
      membersButtonColor = const Color.fromARGB(66, 96, 128, 167);
      groupButtonColor = const Color(0xff141D26);
      tweetButtonColor = const Color(0xff141D26);
      mutualsButtonColor = const Color(0xff141D26);
      displayed = Displayed.members;
    });
  }

  void handleManage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ManageSociety(society: widget.society)));
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
              color: const Color(0xff141D26),
              width: screenWidth,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35,
                      child: ClipOval(child: widget.society["logo"])),
                  Text(
                    widget.society["name"],
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
                              widget.society["followersCount"],
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
                              widget.society["membersCount"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            const Text(
                              "members",
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
                      widget.society["description"],
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
                  (() {
                    if (isPresident) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 35,
                        width: screenWidth * 0.4,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: const BorderSide(
                                        color: Color(0xff6080A7), width: 2.0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xff141D26))),
                            onPressed: handleManage,
                            child: const Text("manage")),
                      );
                    } else {
                      return Container();
                    }
                  })(),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      "President: ${widget.society["president"]}",
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
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff6080A7)))),
                      width: screenWidth,
                      height: 35,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: screenWidth * 0.3,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              tweetButtonColor)),
                                  onPressed: handleTweet,
                                  child: const Text(
                                    "Tweets",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                                width: screenWidth * 0.3,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              groupButtonColor)),
                                  onPressed: handleGroup,
                                  child: const Text(
                                    "Groups",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                                width: screenWidth * 0.3,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              membersButtonColor)),
                                  onPressed: handleMembers,
                                  child: const Text(
                                    "Members",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                                width: screenWidth * 0.3,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              mutualsButtonColor)),
                                  onPressed: handleMutuals,
                                  child: const Text(
                                    "Mutuals",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ]),
                      )),
                  (() {
                    switch (displayed) {
                      case Displayed.tweets:
                        return Container(
                          width: screenWidth,
                          constraints: const BoxConstraints(minHeight: 500),
                          child: Column(children: [
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                          ]),
                        );
                      case Displayed.groups:
                        return SocietyGroupsContainer(
                            groups: widget.society["groups"]);
                      case Displayed.mutuals:
                        return SocietyMutualsContainer(
                          members: widget.society["mutuals"],
                        );
                      case Displayed.members:
                        return SocietyMembersContainer(
                          members: widget.society["members"],
                        );
                      default:
                        return Container(
                          constraints: const BoxConstraints(minHeight: 500),
                          width: screenWidth,
                          child: Column(children: [
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                            SocietyTweet(),
                          ]),
                        );
                    }
                  })(),
                ],
              )))),
    );
  }
}
