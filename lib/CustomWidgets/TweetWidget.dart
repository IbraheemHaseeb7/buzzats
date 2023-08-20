import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Replying.dart';
import 'package:flutter_app_1/pages/CommentSection.dart';
import '../Cache/Query.dart';
import '../Cache/UserProfile.dart';

class TweetWidget extends StatefulWidget {
 String name, time, content, id, twtId;
 int likesCount, repliesCount;
 bool? liked = false;
   var image;

  TweetWidget({
    Key? key,
    this.liked,
    required this.name,
    required this.twtId,
    required this.id,
    required this.image,
    required this.time,
    required this.content,
    required this.repliesCount,
    required this.likesCount,
  });

 
  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  bool isLiked = false;
  var imageBytes;

  @override
  void initState() {
    isLiked = widget.liked!;
    super.initState();
    imageBytes = Uint8List.fromList(List<int>.from(widget.image));
     // Check if the user has already liked the tweet
  }

  

  void handleLike() async {
  int likes = widget.likesCount;

  // Update the likes count based on the like/unlike action
  if (!isLiked) {
    likes++; // Increment likes count if liking the tweet
  } else {
    likes--; // Decrement likes count if unliking the tweet
  }

  // Update the UI with the new likes count and liked status
  setState(() {
    isLiked = !isLiked; // Toggle liked status
    widget.likesCount = likes; // Update likes count in the widget
  });

  String queryStatement;
  if (isLiked) {
    queryStatement =
        "INSERT INTO tb_Like VALUES ('${widget.twtId}', '${widget.id}', GETDATE())";
  } else {
    queryStatement =
        "DELETE FROM tb_Like WHERE TweetID = '${widget.twtId}' AND UserID = '${widget.id}'";
  }

  await query(queryStatement); // Execute the SQL query
}





  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentSection(twtId: widget.twtId)),
        );
      },
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(0xFF141D26),
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: widget.image == null
                    ? Image.asset(
                        "lib/Assets/profile.jpg",
                        width: 50,
                      )
                    : Image.memory(
                        imageBytes,
                        width: 50,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth - 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            (() {
                              switch (widget.id) {
                                case "fa21bcs052":
                                case "fa21bcs140":
                                case "fa21bcs082":
                                  return Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.white,
                                        size: 17,
                                      ));
                                default:
                                  return Container();
                              }
                            })(),
                          ],
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 114, 114, 114),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    width: screenWidth - 100,
                    child: Text(
                      widget.content,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: handleLike,
                                  icon: Icon(
                                    isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                    color: isLiked ? Colors.red : Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.likesCount.toString(),
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) => Replying(twtId: widget.twtId));
                                  },
                                  icon: Icon(
                                    CupertinoIcons.arrow_counterclockwise,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.repliesCount.toString(),
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
