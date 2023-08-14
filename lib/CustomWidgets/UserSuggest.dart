import 'package:flutter/material.dart';

class UserSuggest extends StatefulWidget {
  const UserSuggest({super.key});

  @override
  State<UserSuggest> createState() => _UserSuggest();
}

class _UserSuggest extends State<UserSuggest> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [ 
        Container(
        
        padding: EdgeInsets.only(bottom: 3,top: 3),
        width: screenWidth,
        height: 140,
        decoration: BoxDecoration(
          color: Color(0x00474747),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: Color(0xff6080a7), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
              child: Container(
                padding: EdgeInsets.only(bottom: 4,top: 4),
                height: 90,
                width: 70,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("lib\\Assets\\musaimage.png",
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child: Text(
                      "Musa Raza",

                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "Department: Computer Science",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF6080A7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "Semester: 5",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF6080A7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "Batch: Fall 2021",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
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
      MaterialButton(
        onPressed: () {
          // Nevigate to user profile//
          print("Hi");
        },
        minWidth: screenWidth,
        height: 120,
      ),
    ]);
  }
}
