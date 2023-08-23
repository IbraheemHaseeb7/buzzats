import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/TotalSoc.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/MySoc.dart';
import 'package:flutter_app_1/Skeletons/SuggestUserSkel.dart';

import '../Cache/Query.dart';

class TotalSocieties extends StatefulWidget {
  @override
  TotalSocieties({super.key});
  TotalState createState() => TotalState();
}

class TotalState extends State<TotalSocieties> {
  List<dynamic> soc = [];
  bool isFetched = false;
  String q =
      "select (select count(*) from tb_SocietyMembers mem where mem.SocietyID = soc.SocietyID) as members, soc.SocietyID,soc.PresidentID,soc.About,soc.SocietyName,soc.Picture from tb_Society soc where soc.PresidentID = '${UserData.id}'";

 

  @override
  void initState() {
    UserData();
    super.initState();

    TotalSoc.isEmpty().then((value) {
      if (value) {
        socketQuery(q).then((value) {
          setState(() {
            TotalSoc.storeSoc(value);
            soc = value;
            isFetched = true;
          });
        });
      } else {
        TotalSoc.fetchSoc().then((value) {
          setState(() {
            soc = value;
            isFetched = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("My Societies"),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color(0xff141d26),
          child: isFetched
              ? Column(
                  children: soc
                      .map((e) => MySoc(
                          name: e["SocietyName"],
                          about: e["About"],
                          connections: e["members"],
                          id: e["SocietyID"],
                          president: e["PresidentID"],
                          image: e["Picture"],
                          ))
                      .toList())
              : SuggestUserSkel(),
        ));
  }
}
