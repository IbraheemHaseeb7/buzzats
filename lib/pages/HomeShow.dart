import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Feed.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/CustomWidgets/Notif.dart';
import 'package:flutter_app_1/Skeletons/SocietyTwtSkeleton.dart';
import 'package:flutter_app_1/pages/Notifcations.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Cache/Likes.dart';
import '../CustomWidgets/HomeDrawer.dart';
import '../CustomWidgets/SocietyTweet.dart';
import '../CustomWidgets/TweetWidget.dart';
import 'CreateTweet.dart';

class HomeShow extends StatefulWidget {
  @override
  HomeShowState createState() => HomeShowState();
}

class HomeShowState extends State<HomeShow> {
  List<dynamic> tweets = [];
  List<dynamic> likes = [];
  bool isFetched = false;
  bool liked = false;
  

  String q =
      "select id.UserID, Image as [image], id.[Name],twt.TweetID,twt.Tweet,twt.[Date/Time] as [time], (select count(t.UserID) from tb_Like t where t.TweetID = twt.TweetID ) as likes ,(select count(c.UserID) from tb_Comment c  where c.TweetID = twt.TweetID) as replies from tb_UserProfile id inner join tb_Tweets twt on id.UserID = twt.UserID order by [time] desc";

  @override
  void initState() {
   
    Feed.isEmpty().then((value) {
      if (value) {
        query(q).then((value) {
          setState(() {
           
            Feed.storeTweets(value);
            tweets = value;
            isFetched = true;


          });
        });
      } else {
        Feed.fetchTweets().then((value) {
          setState(() {
            tweets = value;
            isFetched = true;
          });
        });
      }
    });

   
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isSelected = false;

    
    return Scaffold(
      backgroundColor: Color(0xFF141D26),

      appBar: AppBar(
        backgroundColor: Color(0xFF141D26),
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(150, 183, 223, 1),
        ),
        centerTitle: true,
        title: Text(
          "Buzzats",
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(150, 183, 223, 1)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
                onPressed: () {
                  isSelected = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
                icon: Icon(
                  isSelected == true
                      ? IconlyBold.notification
                      : IconlyLight.notification,
                  size: 30,
                  color: Color.fromRGBO(150, 183, 223, 1),
                )),
          )
        ],
      ),

      body: RefreshIndicator(
          onRefresh: () async {
            return query(q).then((value) {
              setState(() {
                Feed.storeTweets(value);
                tweets = value;
                isFetched = true;
              });
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: isFetched
                  ? tweets.map((e) => TweetWidget(
                             liked: liked,
                              twtId: e["TweetID"] ?? "", // Fetching the TweetID from the API response
                              id: e["UserID"] ?? "",
                              name: e["Name"] ?? "",
                              image: e["image"] != null ? e["image"]["data"] : "",
                              time: DateTime.parse(e["time"]).day ==
                                  DateTime.now().day
                              ? DateTime.parse(e["time"]).hour.toString() +
                                  ":" +
                                  DateTime.parse(e["time"]).minute.toString()
                              : DateTime.parse(e["time"]).day.toString() +
                                  DateFormat.MMM()
                                      .format(DateTime.parse(e["time"])),

                                content: e["Tweet"] ?? "",
                                repliesCount: e["replies"] ?? 0,
                                likesCount: e["likes"] ?? 0,
                              )).toList()


                  : [
                      const TweetSkeleton(),
                      const TweetSkeleton(),
                      const TweetSkeleton(),
                    ],
            ),
          )),

      //drawer for extra functions like cui portal

      drawer: HomeDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTweet()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4137BD),
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
  }
}
