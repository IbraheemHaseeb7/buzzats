import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/Notif.dart';
import 'package:intl/intl.dart';

import '../Skeletons/NotifSkeleton.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  createState() => NotificationsState();
}

List<dynamic> notifications = [];

class NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(
        backgroundColor: Color(0xFF141D26),
        title: const Text(
          "Buzzers",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: notifications.map((e) {
                late NotificationTypes nt;
                switch (e["NType"]) {
                  case "Like":
                    nt = NotificationTypes.Like;
                    break;
                  case "Connect":
                    nt = NotificationTypes.Connect;
                    break;
                  case "Comment":
                    nt = NotificationTypes.Comment;
                    break;
                  case "View":
                    nt = NotificationTypes.View;
                    break;
                  default:
                    nt = NotificationTypes.Like;
                    break;
                }
                return Notif(
                  data: e["Data"],
                  type: nt,
                  name: e["Name"],
                  image: e["Image"],
                  time: DateTime.parse(e["time"]).day == DateTime.now().day
                      ? DateTime.parse(e["time"]).hour.toString() +
                          ":" +
                          DateTime.parse(e["time"]).minute.toString()
                      : DateTime.parse(e["time"]).day.toString() +
                          DateFormat.MMM().format(DateTime.parse(e["time"])),
                );
              }).toList()),
        ),
      ),
    );
  }
}


/*

begin tran
	declare @temp varchar(5);
	set @temp = (select concat('N', count(*) + 1) from tb_Notification)
	insert into tb_Notification (NotificationID, UserID, STweetID, TweetID, NType, [Date/Time], [Data])
	values
	(@temp, 'fa21bcs052', null, 'T10', 'Comment', getdate(), 'htjrjtkf4utj');
commit

*/