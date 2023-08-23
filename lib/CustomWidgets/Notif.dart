import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Types {
  Connect,
  Like,
  Comment,
  View,
}

class Notif extends StatelessWidget {
  Notif({required this.type});

  Types type;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Color(0xFF141D26),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(200)),
            child: Image.asset(
              "lib\\Assets\\abdu.jpg",
              width: 35,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            child: Container(
              width: screenWidth - 100,
              padding: EdgeInsets.only(right: 13),
              child: Text(
                type == Types.Like
                    ? "Username liked this post"
                    : type == Types.Comment
                        ? "Username commented: so sus brother. IEEE is the best in town."
                        : type == Types.Connect
                            ? "Username requested the connection"
                            : "Username viewed your profile",
                // Add more cases if needed
                style: TextStyle(color: Colors.white, fontSize: 14),
                maxLines: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                type != Types.Connect && type != Types.View
                    ? ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.asset(
                          "lib\\Assets\\ieee.jpg",
                          width: 37,
                        ),
                      )
                    : type == Types.Connect
                        ? ElevatedButton(
                            onPressed: null,
                            child: Text(
                              "Accept",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.blue),
                          )
                        : type == Types.View
                            ? chooseIcon(type)
                            : Container(),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // Shadow offset
                        ),
                      ],
                    ),
                    child: chooseIcon(type)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseIcon(Types type) {
    switch (type) {
      case Types.Like:
        return Icon(
          Icons.favorite,
          color: Colors.red,
          size: 20,
        );
      case Types.Comment:
        return Icon(
          Icons.comment,
          color: Colors.blue,
          size: 20,
        );
      case Types.View:
        return Icon(
          CupertinoIcons.eye,
          color: Colors.white,
          size: 20,
        );

      default:
        return Container(); // Return an empty Container if none of the cases match
    }
  }
}
