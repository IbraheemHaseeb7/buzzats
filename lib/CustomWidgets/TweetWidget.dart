import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/CustomWidgets/ListMore.dart';
import 'package:flutter_app_1/CustomWidgets/Replying.dart';
import 'package:flutter_app_1/pages/CommentSection.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';
import '../Cache/socket.dart';

class TweetWidget extends StatefulWidget {
  String name, time, content, id, twtId;
  int likesCount, repliesCount;
  bool isLiked;
  var image;

  TweetWidget(
      {Key? key,
      required this.name,
      required this.twtId,
      required this.id,
      required this.image,
      required this.time,
      required this.content,
      required this.repliesCount,
      required this.likesCount,
      required this.isLiked})
      : super(key: key);

  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  bool isLiked = false;
  var imageBytes;
  final t = UserData();

  @override
  void initState() {
    setState(() {
      isLiked = widget.isLiked;
    });
    super.initState();
    if (widget.image != null) {
      imageBytes = Uint8List.fromList(List<int>.from(widget.image));
    }
    // Check if the user has already liked the tweet
  }

  void handleLike() async {
    String queryStatement;
    if (!isLiked) {
      socket.emit("notifications", [
        UserData.user[0]["Name"],
        UserData.user[0]["Image"],
        DateTime.now().toString(),
        widget.id,
        "Like",
        widget.content
      ]);

      queryStatement =
          "begin tran declare @temp varchar(5); set @temp = (select concat('N', count(*) + 1) from tb_Notification) insert into tb_Notification (NotificationID, UserID, STweetID, TweetID, NType, [Date/Time], [Data], ReceiverID) values (@temp, '${UserData.id}', null, '${widget.twtId}', 'Like', getdate(), '${widget.content}', '${widget.id}'); INSERT INTO tb_Like VALUES ('${widget.twtId}', '${UserData.id}', GETDATE()) commit";
      setState(() {
        ++widget.likesCount;
        isLiked = !isLiked;
      });
    } else {
      queryStatement =
          "DELETE FROM tb_Like WHERE TweetID = '${widget.twtId}' AND UserID = '${UserData.id}'";
      setState(() {
        --widget.likesCount;
        isLiked = !isLiked;
      });
    }
    await socketQuery(queryStatement).then((value) {}).catchError((err) {
      ToastMe(text: "Error occurred!", type: ToasterType.Error)
          .showToast(context);
      if (isLiked) {
        setState(() {
          --widget.likesCount;
          isLiked = false;
        });
      } else {
        setState(() {
          ++widget.likesCount;
          isLiked = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        showBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: ((context) => CommentSection(twtId: widget.twtId)));
      },
      child: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
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
              padding: const EdgeInsets.only(top: 12, left: 12, right: 8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                child: widget.image == null
                    ? Image.asset(
                        "lib/Assets/profile.jpg",
                        fit: BoxFit.cover,
                        width: 40,
                      )
                    : Image.memory(
                        imageBytes,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 7, left: 8, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth - 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            (() {
                              switch (widget.id) {
                                case "fa21bcs052":
                                case "fa21bcs140":
                                case "fa21bcs082":
                                  return const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.white,
                                        size: 16,
                                      ));
                                default:
                                  return Container();
                              }
                            })(),
                          ],
                        ),
                        Text(
                          widget.time,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 114, 114, 114),
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
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: handleLike,
                                  icon: Icon(
                                    isLiked
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: isLiked ? Colors.red : Colors.white,
                                  ),
                                  color: Colors.white,
                                  iconSize: 20,
                                ),
                                Text(
                                  widget.likesCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) =>
                                            Replying(twtId: widget.twtId));
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.arrow_counterclockwise,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  iconSize: 20,
                                ),
                                Text(
                                  widget.repliesCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor:
                                        const Color.fromARGB(255, 33, 47, 61),
                                    builder: (context) => ListMore(
                                        id: widget.id, twtId: widget.twtId));
                              },
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              iconSize: 20,
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
