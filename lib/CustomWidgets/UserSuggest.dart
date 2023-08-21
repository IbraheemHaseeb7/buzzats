import 'dart:typed_data';

import 'package:flutter/material.dart';

String name = "abc";
String batch = "abc";
int semester = 0;
String department = "abc";
String bio = "abc";
Uint8List? bytes;

class UserSuggest extends StatefulWidget {
  void getData(String nameRec, int semesterRec, String departmentRec,
      String batchRec, String bioRec, Uint8List? bytesRec) {
    name = nameRec;
    semester = semesterRec;
    department = departmentRec;
    batch = batchRec;
    bio = bioRec;
    bytes = bytesRec;
  }

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
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: screenWidth,
        height: 140,
        decoration: BoxDecoration(
          color: const Color(0x00474747),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: const Color(0xff6080a7), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 3, 20, 0),
              child: Container(
                padding: EdgeInsets.only(bottom: 4,top: 4),
                height: 90,
                width: 70,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: bytes != null
              ? Image.memory(bytes!, width: 200, height: 200)
              : CircularProgressIndicator(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Text(
                          name,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xffffffff),
                          ),
                        ),
                        
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "Department: $department",
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
                        "Semester: $semester",
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF6080A7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Batch: $batch",
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
