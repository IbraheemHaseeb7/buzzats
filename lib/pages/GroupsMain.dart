import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/AppliedContain.dart';
import 'package:flutter_app_1/CustomWidgets/GMContain.dart';
import 'package:flutter_app_1/Skeletons/SocietyTwtSkeleton.dart';
import 'package:iconly/iconly.dart';


class GroupsMain extends StatefulWidget {
  
 
  const GroupsMain({
  
    super.key, 
   
    });

  @override
  GState createState() => GState();
}

enum Displayed { tweets,members,applied }

class GState extends State<GroupsMain> {
  Color tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
  Color appliedButtonColor = const Color(0xff141D26);
  Color membersButtonColor = const Color(0xff141D26);
  Displayed displayed = Displayed.tweets;

  final bool isPresident = true;




  @override
  void initState(){
    super.initState();


  }


  
void handleApplied() {
   setState(() {
     tweetButtonColor = const Color(0xff141D26);
    appliedButtonColor =  const Color.fromARGB(66, 96, 128, 167);
    membersButtonColor = const Color(0xff141D26);

    displayed = Displayed.applied;
     });
  }

  void handleTweet() {
    setState(() {
      tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
      appliedButtonColor = const Color(0xff141D26);
      membersButtonColor = const Color(0xff141D26);
      displayed = Displayed.tweets;
    });
  }

  
  void handleMembers() {
    setState(() {
      membersButtonColor = const Color.fromARGB(66, 96, 128, 167);
     appliedButtonColor = const Color(0xff141D26);    
      tweetButtonColor = const Color(0xff141D26);
     
      displayed = Displayed.members;
    });
  }

 

  @override
  void dispose(){
    super.dispose();
  }


  Future<void> handleRefresh() async {}


  @override
  Widget build(BuildContext context) {
  
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
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
                      child: const Icon(IconlyLight.camera,color: Colors.white,size: 60,)     ),
                  const Text(
                    "Photography Team",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                  
                        Column(
                          children: [
                            Text(
                             "50",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            Text(
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
                    child: const Text(
                      "Down Since day one ish",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff6080A7),
                          decoration: TextDecoration.none,
                          fontSize: 15),
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
                              SizedBox(
                                height: 35,
                                width: screenWidth * 0.4,
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
                              SizedBox(
                                height: 35,
                                width: screenWidth * 0.4,
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
                             
                              SizedBox(
                                height: 35,
                                width: screenWidth * 0.4,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                             appliedButtonColor)),
                                  onPressed: handleApplied,
                                  child: const Text(
                                    "Applied",
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
                          child: const Column(
                            children: [
                              //SocietyTweet(name: "name", tweet: "tweet")


                            ] ),
                        );
                      
                      case Displayed.applied:
                        return const AppliedContain();
                     

                      case Displayed.members:
                        return const GMContain();

                         
                      default:
                        return Container(
                          constraints: const BoxConstraints(minHeight: 500),
                          width: screenWidth,
                          child: const Column(children: [
                            SocietyTwtSkeleton()
                          ]),
                        );
                    }
                  })(),
                ],
              )))),
    );
  }
}
