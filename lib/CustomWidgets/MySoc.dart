// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/Society.dart';

import '../Cache/Society.dart';
import '../Cache/UserProfile.dart';

class MySoc extends StatefulWidget {
  String name, about, id, president, presidentId;
  int connections;
  var image;

  MySoc({
    super.key,
    required this.name,
    required this.connections,
    required this.about,
    required this.id,
    required this.president,
    required this.presidentId,
    required this.image,
  });

  @override
  SocState createState() => SocState();
}

class SocState extends State<MySoc> {
  late String q2;
  List<dynamic> members = [];
  List<dynamic> groups = [];
  bool isMember = false;

  @override
  void initState() {
    UserData();

    // UserData.fetchUser().then((value){
    //       setState(() {

    //           print(value[0]["name"]);
    //           widget.president = value[0]["name"];
    //       });

    //         });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    print(widget.about);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Society(
                      memberss: const [],
                      name: widget.name,
                      groups: groups,
                      id: widget.id,
                      about: widget.about,
                      presidentId: widget.presidentId,
                      members: widget.connections,
                      society: SocietyData.societies[0],
                      president: widget.president,
                      image: widget.image,
                    )));
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: screenWidth,
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0x00474747),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff6080a7), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: Text(
                              widget.name,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 21,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(width: 8,),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     width: screenWidth * 0.2, // Adjust the percentage as needed
                      //      height: screenHeight * 0.05, // Adjust the percentage as needed
                      //       child: ElevatedButton(
                      //       onPressed: null,
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: const Color(0xFF6080A7),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20.0), // Adjust the value as needed
                      //         ),
                      //         fixedSize: Size(7,8), // Adjust the height

                      //       ),
                      //       child: Text("Open"),
                      //                         ),
                      //     ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "${widget.connections} Members",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF6080A7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        widget.about,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
