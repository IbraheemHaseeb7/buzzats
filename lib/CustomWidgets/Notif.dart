import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NotificationTypes {
  Connect,
  Like,
  Comment,
  View,
}

class Notif extends StatefulWidget {
  NotificationTypes type;
  String name, time;
  String? data;
  var image;
  Notif(
      {required this.type,
      required this.name,
      this.data,
      required this.image,
      required this.time});

  @override
  createState() => NotifState();
}

class NotifState extends State<Notif> {
  var bytes;
  @override
  void initState() {
    setState(() {
      bytes = Uint8List.fromList(List<int>.from(widget.image));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF141D26),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(200)),
            child: Image.memory(
              bytes,
              width: 35,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Container(
              width: screenWidth - 100,
              padding: EdgeInsets.only(right: 13),
              child: Text(
                widget.type == NotificationTypes.Like
                    ? "${widget.name} liked this post"
                    : widget.type == NotificationTypes.Comment
                        ? "${widget.name} commented: ${widget.data}"
                        : widget.type == NotificationTypes.Connect
                            ? "${widget.name} requested the connection"
                            : "${widget.name} viewed your profile",
                // Add more cases if needed
                style: TextStyle(color: Colors.white, fontSize: 14),
                maxLines: null,
              ),
            ),
          ),
          Container(child: chooseIcon(widget.type)),
        ],
      ),
    );
  }

  Widget chooseIcon(NotificationTypes type) {
    switch (type) {
      case NotificationTypes.Like:
        return const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 20,
        );
      case NotificationTypes.Comment:
        return const Icon(
          Icons.comment,
          color: Colors.blue,
          size: 20,
        );
      case NotificationTypes.View:
        return const Icon(
          CupertinoIcons.eye,
          color: Colors.white,
          size: 20,
        );
      case NotificationTypes.Connect:
        return const Icon(
          Icons.hub,
          color: Colors.white,
          size: 20,
        );

      default:
        return Container(); // Return an empty Container if none of the cases match
    }
  }
}
