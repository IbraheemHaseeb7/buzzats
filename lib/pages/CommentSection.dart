import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/Skeletons/CommentSkeleton.dart';
import 'package:flutter_app_1/pages/SearchUser.dart';
import 'package:intl/intl.dart';
import '../Cache/Query.dart';

class CommentSection extends StatelessWidget {
  final String twtId;

  CommentSection({
    required this.twtId,
  });

  @override
  Widget build(BuildContext context) {
    String q =
        "select id.UserID, Image as [image], id.[Name],reply.TweetID,reply.Comment,reply.[Date/Time] as [time] from tb_UserProfile id inner join tb_Comment reply on id.UserID = reply.UserID where TweetID = '$twtId' order by [time] desc";

    return Padding(
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
                child: Container(),
                // TweetWidget(),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                      child: RefreshIndicator(
                        onRefresh: () async {
                          // Fetch new comments here if needed
                        },
                        child: FutureBuilder<List<dynamic>>(
                          future: socketQuery(q),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                  width: screenWidth,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )));
                            } else if (snapshot.hasError) {
                              return Container(
                                  width: screenWidth,
                                  child: const Center(
                                    child: Text(
                                      "Error fetching comments",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ));
                            } else if (snapshot.hasData &&
                                snapshot.data!.isEmpty) {
                              return Container(
                                  width: screenWidth,
                                  child: const Center(
                                    child: Text(
                                      "No Comments yet",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ));
                            } else if (snapshot.hasData) {
                              List<dynamic> comments = snapshot.data!;

                              return SingleChildScrollView(
                                child: Column(
                                  children: comments
                                      .map((e) => Reply(
                                            twtId: e["TweetID"],
                                            id: e["UserID"] ?? "",
                                            name: e["Name"] ?? "",
                                            image: e["image"] ?? "",
                                            time: DateTime.parse(e["time"])
                                                        .day ==
                                                    DateTime.now().day
                                                ? DateTime.parse(e["time"])
                                                        .hour
                                                        .toString() +
                                                    ":" +
                                                    DateTime.parse(e["time"])
                                                        .minute
                                                        .toString()
                                                : DateTime.parse(e["time"])
                                                        .day
                                                        .toString() +
                                                    DateFormat.MMM().format(
                                                        DateTime.parse(
                                                            e["time"])),
                                            content: e["Comment"] ?? "",
                                          ))
                                      .toList(),
                                ),
                              );
                            } else {
                              return Text('No data available');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}
