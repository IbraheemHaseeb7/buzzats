import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/CustomWidgets/ConUser.dart';
import 'package:flutter_app_1/Skeletons/ChatSkeleton.dart';


class Connections extends StatefulWidget {
 // List<dynamic> members;
 var id;
  Connections({
    super.key, 
    required this.id
    });

  @override
  ConnectState createState() =>
      ConnectState();
}

class ConnectState extends State<Connections> {
  
late String  q2; 

  List<dynamic> connections = [];
  bool isFetched = false;


  @override
  void initState() {
q2= " select * from tb_Friends friend inner join tb_UserProfile us on friend.FriendUserID = us.UserID where friend.UserID = '${widget.id}'";

    query(q2).then(
      (value) {
        print(value);
        connections = value;
        setState(() {
          isFetched = true;
        });
      });


    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void handleChange(String? value) {
    // setState(() {
    //   if (value == "") {
    //     widget.members = widget.members;
    //   }
    //   for (int i = 0; i < widget.members.length; i++) {
    //     if (value == widget.members[i]["name"]) {
    //       widget.members = [widget.members[i]];
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color(0xff141d26),
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
                      hintText: "Search Connections",
                      hintStyle:
                          const TextStyle(color: Color(0xff6080A7), fontSize: 12)),
                ),
              ),
              Container(
                child: Column(
                    children: isFetched ? connections.map((e) {

                      return ConUser(
                          name: e["Name"],
                          image: e["Image"],
                          id: e["FriendUserID"] ?? "",


                      );

                    }).toList() : 
                    [
                      const ChatSkeleton(),
                      const ChatSkeleton(),
                      const ChatSkeleton(),
                      const ChatSkeleton(),

                    ]
                    
                    ),
              )
            ],
          )),
    );
  }
}
