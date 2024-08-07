import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/TotalSoc.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/CustomWidgets/MySoc.dart';
import 'package:flutter_app_1/Skeletons/SuggestUserSkel.dart';


class TotalSocieties extends StatefulWidget {
  @override
  const TotalSocieties({super.key});
  @override
  TotalState createState() => TotalState();
}

class TotalState extends State<TotalSocieties> {
  List<dynamic> soc = [];
  bool isFetched = false;
  String q =
      "select (select count(*) from tb_SocietyMembers mem where mem.SocietyID = soc.SocietyID) as members, soc.SocietyID, (select [Name] from tb_UserProfile u where u.[UserID]=soc.PresidentID) as President, soc.PresidentID,soc.About, soc.Picture, soc.SocietyName from tb_Society soc where soc.PresidentID = '${UserData.id}'";

  @override
  void initState() {
    UserData();
    super.initState();

    // TotalSoc.isEmpty().then((value) {
    //   if (value) {
    (() async {
      await socketQuery(q).then((value) {
        setState(() {
          TotalSoc.storeSoc(value);
          soc = value;
          isFetched = true;
        });
      });
    })();
    // } else {
    //   TotalSoc.fetchSoc().then((value) {
    //     setState(() {
    //       soc = value;
    //       isFetched = true;
    //     });
    //   });
    // }
    // });
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
          elevation: 0,
          title: const Text("My Societies"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: screenWidth,
          height: screenHeight,
          color: const Color(0xff141d26),
          child: isFetched
              ? Column(
                  children: soc
                      .map((e) => MySoc(
                            presidentId: e["PresidentID"],
                            name: e["SocietyName"],
                            about: e["About"],
                            connections: e["members"],
                            id: e["SocietyID"],
                            president: e["President"],
                            image: e["Picture"],
                          ))
                      .toList())
              : const SuggestUserSkel(),
        ));
  }
}
