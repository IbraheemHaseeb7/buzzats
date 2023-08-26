import 'package:flutter/material.dart';

import '../Cache/MembersCache.dart';
import '../Cache/socket.dart';
import 'SocietyMember.dart';

class SocietyMembersContainer extends StatefulWidget {
  List<dynamic> members;
  String id;
  SocietyMembersContainer({super.key, required this.members, required this.id});

  @override
  _SocietyMembersContainerState createState() =>
      _SocietyMembersContainerState();
}

class _SocietyMembersContainerState extends State<SocietyMembersContainer> {
  late String q2 =
      " select prof.UserID,prof.[Name],prof.BIO, prof.[Image]	from tb_UserProfile prof inner join tb_SocietyMembers members on members.UserID = prof.UserID where members.SocietyID = '${widget.id}'";

  bool isMember = false;
  List<dynamic> sameMembers = [];

  @override
  void initState() {
    MembersCache.fetchM().then((value) {
      for (int index = 0; index < value.length; index++) {
        print(value[index]["SocietyID"]);
        if (value[index]["SocietyID"] == widget.id) {
          setState(() {
            print("fghhjfegfvgjevj  $value");
            isMember = true;
            print("neyvhwev    ${value[index]["Member"]}");
            sameMembers = value[index]["Member"];
          });
          return;
        }
      }

      socketQuery(q2).then((e) {
        setState(() {
          widget.members.add({"Member": e, "SocietyID": widget.id});
          MembersCache.storeM(widget.members);
          sameMembers = e;

          isMember = true;
        });
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleChange(String? value) {
    setState(() {
      if (value == "") {
        widget.members = widget.members;
      }
      for (int i = 0; i < widget.members.length; i++) {
        if (value == widget.members[i]["name"]) {
          widget.members = [widget.members[i]];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        constraints: const BoxConstraints(minHeight: 500),
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 12),
                onChanged: handleChange,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: const Color(0xff6080A7),
                    // filled: true,
                    // fillColor: Color.fromARGB(59, 96, 128, 167),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            color: Color(0xff6080A7), width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            color: Color(0xff6080A7), width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            color: Color(0xff6080A7), width: 1)),
                    hintText: "Search Members",
                    hintStyle:
                        TextStyle(color: Color(0xff6080A7), fontSize: 12)),
              ),
            ),
            Container(
              child: Column(
                  children: sameMembers
                      .map((e) => SocietyMember(
                            image: e["Image"],
                            name: e["Name"],
                          ))
                      .toList()),
            )
          ],
        ));
  }
}
