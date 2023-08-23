import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Feed.dart';
// import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/Notif.dart';
import 'package:flutter_app_1/Skeletons/SocietyTwtSkeleton.dart';
import 'package:flutter_app_1/pages/Notifcations.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';
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
  static List<dynamic> tweets = [];
  final scrollController = ScrollController();
  List<dynamic> likes = [];
  bool isFetched = false;
  bool isLoadingMore = false;
  UserData u = UserData();
  var renderedTweets;
  String q =
      "select Image as [image], id.[UserID], id.[Name],twt.TweetID,twt.Tweet, twt.[Date/Time] as [time], (select count(t.TweetID) from tb_Like t where t.TweetID = twt.TweetID ) as likes, (select isnull('yes','no') from tb_Like tl where tl.TweetID=twt.TweetID and tl.UserID='${UserData.id}') as 'HasLiked', (select count(c.TweetID) from tb_Comment c  where c.TweetID = twt.TweetID) as replies from tb_UserProfile id inner join tb_Tweets twt on id.UserID = twt.UserID order by [time] desc offset 0 rows fetch next 6 rows only";

  @override
  void initState() {
    Feed.isEmpty().then((value) {
      if (value) {
        socketQuery(q).then((e) {
          setState(() {
            Feed.storeTweets(e);
            tweets = e;
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

    scrollController.addListener(scrollListener);

    super.initState();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
        loadMore();
      });
    }
  }

  void loadMore() {
    socketQuery(
            "select Image as [image], id.[UserID], id.[Name],twt.TweetID,twt.Tweet, twt.[Date/Time] as [time], (select count(t.TweetID) from tb_Like t where t.TweetID = twt.TweetID ) as likes, (select isnull('yes','no') from tb_Like tl where tl.TweetID=twt.TweetID and tl.UserID='${UserData.id}') as 'HasLiked',(select count(c.TweetID) from tb_Comment c  where c.TweetID = twt.TweetID) as replies from tb_UserProfile id inner join tb_Tweets twt on id.UserID = twt.UserID where twt.[Date/Time] < '${tweets[tweets.length - 1]["time"]}'order by [time] desc offset 0 rows fetch next 6 rows only")
        .then((value) {
      setState(() {
        tweets.addAll(value);
        isLoadingMore = false;
      });
    }).catchError((e) {
      ToastMe(text: "Error Occurred!", type: ToasterType.Error, duration: 2000)
          .showToast(context);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
            return socketQuery(q).then((value) {
              setState(() {
                Feed.storeTweets(value);
                tweets = value;
                isFetched = true;
              });
            }).catchError((err) {
              ToastMe(
                      text: "Error Occurred",
                      type: ToasterType.Error,
                      duration: 2000)
                  .showToast(context);
            });
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: isFetched
                  ? [
                      Column(
                          children: tweets.map((e) {
                        return TweetWidget(
                          isLiked: e["HasLiked"] == "yes",
                          twtId: e["TweetID"],
                          id: e["UserID"] ?? "",
                          name: e["Name"] ?? "",
                          image: e["image"] ?? "",
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
                        );
                      }).toList()),
                      (() {
                        if (isLoadingMore) {
                          return Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return Container();
                      })()
                    ]
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
}
