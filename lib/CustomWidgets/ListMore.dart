import 'package:dialogs/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/pages/SearchedUser.dart';
import 'package:iconly/iconly.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

import '../Cache/UserProfile.dart';

class ListMore extends StatelessWidget {
  String id, twtId;
  ListMore({super.key, required this.id, required this.twtId});

  @override
  Widget build(BuildContext context) {
    UserData();
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 33, 47, 61),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(300), topRight: Radius.circular(40)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          id == UserData.id
              ? GestureDetector(
                  onTap: () {
                    ChoiceDialog(
                      dialogBackgroundColor: Color.fromARGB(255, 33, 47, 61),
                      title: "Delete",
                      titleColor: Colors.white,
                      message: "Are you sure you want to delete this post?",
                      messageColor: Colors.white,
                      buttonOkColor: const Color.fromARGB(255, 170, 30, 20),
                      buttonOkOnPressed: () {
                        ToasterController toasterController =
                            ToasterController();
                        ToastMe(
                                text: "Deleting",
                                type: ToasterType.Loading,
                                controller: toasterController)
                            .showToast(context);

                        socketQuery(
                                "delete from tb_Tweets where TweetID = '$twtId';")
                            .then((v) {
                          print(twtId);
                          toasterController.end();
                          ToastMe(
                                  text: "Deleted",
                                  type: ToasterType.Check,
                                  duration: 2000)
                              .showToast(context);
                          Navigator.pop(context);
                        }).catchError((err) {
                          toasterController.end();
                          ToastMe(
                                  text: "Error Occurred",
                                  type: ToasterType.Error,
                                  duration: 2000)
                              .showToast(context);
                        });
                      },
                      buttonOkText: "Delete",
                      buttonCancelText: "Cancel",
                      buttonCancelOnPressed: () {
                        Navigator.pop(context);
                      },
                      buttonCancelBorderColor: Color.fromARGB(255, 33, 47, 61),
                    ).show(context);
                  },
                  child: ListTile(
                    leading: Icon(
                      IconlyLight.delete,
                      color: Color.fromARGB(255, 179, 12, 0),
                    ),
                    title: Text(
                      "Delete",
                      style: TextStyle(color: Color.fromARGB(255, 179, 12, 0)),
                    ),
                  ),
                )
              : Container(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchedUser(myself: id == UserData.id ? true : false)),
              );
            },
            child: ListTile(
              leading: Icon(
                IconlyLight.user_1,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              title: Text(
                "View Profile",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              IconlyLight.plus,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "Connect",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ],
      ),
    );
  }
}
