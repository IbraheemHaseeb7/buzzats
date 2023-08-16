import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/Skeletons/CommentSkeleton.dart';
import 'package:intl/intl.dart';

import '../Cache/Comments.dart';
import '../Cache/Query.dart';


class CommentSection extends StatefulWidget {
  String twtId;

  CommentSection(
    {
      super.key,
      required this.twtId,
      });

  @override
  CommentState createState() => CommentState();
}

class CommentState extends State<CommentSection> {

  List<dynamic> comments = [];
  bool isFetched = false;


  
  @override
  void initState() {
  String q = "select id.UserID, Image as [image], id.[Name],reply.TweetID,reply.Comment,reply.[Date/Time] as [time] from tb_UserProfile id inner join tb_Comment reply on id.UserID = reply.UserID where TweetID = '${widget.twtId}' order by [time] desc";

    Comments.isEmpty().then((value) {
      if (value) {
        query(q).then((value) {
          setState(() {
            Comments.storeReplies(value);
            comments = value;
            isFetched = true;
          });
        });
      } else {
        Comments.fetchReplies().then((value) {
          setState(() {
            comments = value;
            isFetched = true;
          });
        });
      }
    });
   
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

  String q = "select id.UserID, Image as [image], id.[Name],reply.TweetID,reply.Comment,reply.[Date/Time] as [time] from tb_UserProfile id inner join tb_Comment reply on id.UserID = reply.UserID where TweetID = '${widget.twtId}' order by [time] desc";
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(
        actions: [],
        title: Text("Tweet"),
        centerTitle: true,
        backgroundColor: Color(0xFF141D26),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF141D26),
                  ),
                  alignment: Alignment.topCenter,
                  child: Container()
                  // TweetWidget(),
                  ),
            ),
            Expanded(
              child: Container(
                //height: screenHeight - 300,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 33, 47, 61),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 12, left: 20),
                      child: Text(
                        "Comments",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Expanded(
                      child:RefreshIndicator(
          onRefresh: () async {
            return query(q).then((value) {
              setState(() {
                Comments.storeReplies(value);
               comments = value;
                isFetched = true;
              });
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children:comments.map((e) => Reply(
                              twtId: e["TweetID"], // Fetching the TweetID from the API response
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

                                content: e["Comment"] ?? "",
                               
                              )).toList(),


                  // : [
                  //     CommentSkeleton(),
                  //     CommentSkeleton(),
                  //     CommentSkeleton(),
                  //     CommentSkeleton(),
                  //     CommentSkeleton(),
                  //     CommentSkeleton(),
                  //   ],
            ),
          )
                    ),

                    ),
                  ],
              
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
