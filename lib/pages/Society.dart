import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/MembersCache.dart';
import 'package:flutter_app_1/Cache/MutualsCache.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/Groups.dart';
import 'package:flutter_app_1/Cache/GroupsCache.dart';
import 'package:flutter_app_1/CustomWidgets/PushNotif.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyGroupsContainer.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMember.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMembersContainer.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMutualsContainer.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMutual.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyTweet.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/CustomWidgets/UserSuggest.dart';
import 'package:flutter_app_1/Skeletons/SocietyTwtSkeleton.dart';
import 'package:flutter_app_1/pages/Apply.dart';
import 'package:flutter_app_1/pages/ManageSociety.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../Cache/Query.dart';
import '../Cache/GroupsCache.dart';
import '../Cache/SocietyMain.dart';
import '../Cache/UserProfile.dart';
import 'CreateSocietyTweet.dart';

class Society extends StatefulWidget {
  
  Map<String,dynamic> society;
  String name,id,about,president;
  var image;
  List<dynamic> groups = [];
  List<dynamic> memberss = [];
  int members;
  

  Society({
  
    
    super.key, 
    required this.name,
    required this.groups,
    required this.id,
    required this.about,
    required this.members,
    required this.memberss,
    required this.society,
    required this.president,
    required this.image,
    
    
    });

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
  bool isTweet = false;
  List<dynamic> tweetsWithSameId = [];  //use this list for the tweets fetching
  List<dynamic> tweets = [];  //use this list for the tweets fetching
  late String q2;
  late String q3;
  List<dynamic> sameGroups = [];
  List<dynamic> groups = [];
  List<dynamic> sameMembers = [];

  List<dynamic> mutuals = [];
  bool isGroup = false;
  bool isMember = false;
  bool isMutual = false;
  bool hasTweets = true;
  int groupsCount = 0;
  var imageBytes;



  void initState(){
    if(widget.image!=null)
    {

    imageBytes = Uint8List.fromList(List<int>.from(widget.image));
    }
    

    // SocietyMain.delete();
    UserData();

   q2 = "select twt.STweet,twt.SGroupID,twt.Picture, (select count(l.UserID) from STweetsLike l where l.STweetID = twt.STweetID) as likes,(select isnull('yes','no') from STweetsLike tl where tl.STweetID=twt.STweetID and tl.UserID='${UserData.id}') as 'HasLiked' from tb_SocietyTweets twt where twt.SocietyID = '${widget.id}'";
   
    q3 = "select count(soc.SGroupID) as groups, soc.* from tb_SocietyGroups soc where soc.SocietyID = '${widget.id}' group by soc.SGroupName,soc.SGroupID,soc.SocietyID,soc.DirectorID,soc.[description] ";

    

    GroupsCache.fetchGc().then((value) {
 
    widget.groups = value;
    print(widget.groups);
  

    for(int index =0;index<value.length;index++)
    {

        print(value[index]["SocietyID"]);
        if(value[index]["SocietyID"]==widget.id)
        {
          setState(() {
          print("fghhjfegfvgjevj  $value");
          isGroup = true; 
          print("neyvhwev    ${value[index]["SGroupsName"]}");
          sameGroups = value[index]["SGroupsName"];
          }  );
           return;
        }
      

    }
    socketQuery(q3).then((e){

           setState(() {
            
            widget.groups.add({"SGroupsName":e , "SocietyID":widget.id});
            GroupsCache.storeGc(widget.groups);
            sameGroups = e;
          
            isGroup = true;
           
          


          });
       

    });

    });









          
  SocietyMain.fetchTwts().then((value) {
 
    tweets = value;
          print(value);

    for(int index =0;index<value.length;index++)
    {
        if(value[index]["SocietyID"]==widget.id)
        {
          setState(() {
          isTweet = true; 
          tweetsWithSameId= value[index]["STweet"];
            
          });
           return;
        }
      

    }
    socketQuery(q2).then((e){

           setState(() {
            
            tweets.add({"STweet":e , "SocietyID":widget.id});
            SocietyMain.storeTwts(tweets);
            tweetsWithSameId = e;
          
            isTweet = true;


          });
       

    });

    });
    
    super.initState();


  }


  void handleFollow() {
    // List temp = widget.groups.map((e) {
    //   return Groups(
    //     group: e,
    //   );
    // }).toList();
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

  void dispose(){
    super.dispose();
  }
  Future<void> handleRefresh() async {}

  @override
  Widget build(BuildContext context) {
  
      
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(toolbarHeight: 40,title: Text(widget.name),centerTitle: true,actions: [IconButton(
        icon: Icon(IconlyLight.notification), // Change the icon as needed
        onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PushNotif()), // Replace YourNewPage with the actual page you want to navigate to
          );
        },
      ),
],),
      body: RefreshIndicator(
          onRefresh: handleRefresh,
          child: Container(
              padding: const EdgeInsets.only(top: 30),
              color: const Color(0xff141D26),
              width: screenWidth,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35,
                      child: ClipOval(child:  widget.image == null
                    ? Image.asset(
                        "lib/Assets/profile.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                      )
                    : Image.memory(
                        imageBytes,
                        width: 50,
                        fit: BoxFit.cover,
                      ),)),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
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
                              sameGroups.length.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            const Text(
                              "Groups",
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
                              widget.members.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                            const Text(
                              "Members",
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
                      widget.about,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xff6080A7),
                          decoration: TextDecoration.none,
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: screenWidth,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Container(
                          //     height: 35,
                          //     width: screenWidth * 0.4,
                          //     child: ElevatedButton(
                          //         style: ButtonStyle(
                          //             shape: MaterialStateProperty.all<
                          //                 RoundedRectangleBorder>(
                          //               RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(50.0),
                          //                 side: const BorderSide(
                          //                     color: Color(0xff6080A7),
                          //                     width: 2.0),
                          //               ),
                          //             ),
                          //             backgroundColor:
                          //                 MaterialStateProperty.all<Color>(
                          //                     const Color(0xff141D26))),
                          //         onPressed: handleFollow,
                          //         child: const Text("follow"))),
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
                      "President: ${widget.president}",
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
                          child: Column(
                            children: isTweet && tweetsWithSameId.isNotEmpty? tweetsWithSameId.map((e){
                              return SocietyTweet(
                                  name: widget.name,
                                 tweet: e["STweet"] ?? "",
                                 likesCount: e["likes"] ?? 0,
                                 isLiked: e["HasLiked"] == "yes",
                              //    time:DateTime.parse(e["time"]).day ==
                              //     DateTime.now().day
                              // ? DateTime.parse(e["time"]).hour.toString() +
                              //     ":" +
                              //     DateTime.parse(e["time"]).minute.toString()
                              // : DateTime.parse(e["time"]).day.toString() +
                              //     DateFormat.MMM()
                              //         .format(DateTime.parse(e["time"])),
                                 twtId: e["STweetID"] ?? "",
                                 image: widget.image,
                                 tweetImage: e["Picture"] ?? [],


                              );
                              
                            }
                            ).toList() :
                            tweetsWithSameId.isEmpty ? [Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(child: Text("No tweets available",style: TextStyle(color: Colors.white),)),
                            ),] :
                            [

                                  SocietyTwtSkeleton(),
                                  SocietyTwtSkeleton(),
                                  SocietyTwtSkeleton(),

                                  // SocietyTweet()
                            ],
                            ),
                        );
                      case Displayed.groups: 
                        return SocietyGroupsContainer(
                            groups:sameGroups, id: widget.id,isGroup: isGroup,);
                      case Displayed.mutuals:
                        return SocietyMutualsContainer(
                          members: mutuals,
                          id: widget.id,
                          isMutual: isMutual,
                        );
                      case Displayed.members:
                        return SocietyMembersContainer(
                          members: sameMembers,
                          id: widget.id,
                        );
                      default:
                        return Container(
                          constraints: const BoxConstraints(minHeight: 500),
                          width: screenWidth,
                          child: Column(children: [
                            SocietyTwtSkeleton()
                          ]),
                        );
                    }
                  })(),
                ],
              )))),
              floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CreateSocietyTweet(id: widget.id, groups: widget.groups,image: widget.image,)),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4137BD),
      ),
    );
  }
}
