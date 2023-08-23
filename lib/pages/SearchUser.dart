import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/Skeletons/ChatSkeleton.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:flutter_app_1/pages/SuggestionPage.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import '../CustomWidgets/UserSuggest.dart';
import '../Skeletons/SuggestUserSkel.dart';
import 'SearchedUser.dart';
import 'Userlist.dart';

String? batchFinal;
String query = 'test';
double? screenWidth;

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUser();
}

class _SearchUser extends State<SearchUser> {
  Timer? _debounce;

  final TextEditingController _queryController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff141d26),
      appBar: AppBar(
        toolbarHeight: 3,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(6, 0, 0, 6),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(IconlyLight.arrow_left_2),
                  color: Colors.white,
                  iconSize: 24,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(1, 15, 10, 20),
                  child: TextField(
                    controller: _queryController,
                    autofocus: true,
                    onChanged: (text) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        if (text != "") {
                          setState(() {
                            query = text;
                          });
                        }
                      });
                    },
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0x006080a7), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0x006080a7), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Color(0x006080a7), width: 1),
                      ),
                      hintText: "Search Users",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                      filled: true,
                      fillColor: const Color(0x20ffffff),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(8, 4, 12, 4),
                      prefixIcon: const Icon(IconlyLight.search,
                          color: Color(0xffffffff), size: 28),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3, right: 7),
                child: Icon(
                  IconlyLight.filter_2,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          FutureBuilder<List<dynamic>>(
            future: socketQuery(
                "SELECT COUNT(f.FriendUserID) AS 'Connections', u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section FROM tb_UserProfile u INNER JOIN tb_Friends f ON f.FriendUserID = u.UserID WHERE u.Name like '%$query%' GROUP BY u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section;"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ChatSkeleton(),
                      ChatSkeleton(),
                      ChatSkeleton(),
                      ChatSkeleton(),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text(
                  'No users found.',
                  style: TextStyle(color: Colors.white),
                );
              } else {
                List<dynamic> data = snapshot.data!;

                return Column(
                  children: data.map((user) {
                    return userGet(user: user);
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class userGet extends StatelessWidget {
  Map<String, dynamic> user;

  userGet({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    batchFinal = user["Email"].toString().substring(0, 4);
    batchFinal = batchFinal!.toUpperCase();
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => UserProfile(
                        myself: false,
                        user: user,
                      )));
        },
        child: Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: screenWidth,
          decoration: const BoxDecoration(
              color: Color(0x00474747),
              shape: BoxShape.rectangle,
              border: Border(
                  top: BorderSide(color: Color(0xff6080a7), width: 1),
                  bottom: BorderSide(color: Color(0xff6080a7), width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: user["Image"] != null
                      ? Image.memory(user["Image"]!, width: 50, height: 50)
                      : Image.asset("lib/Assets/profile.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        user["Name"],
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
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        "Batch: $batchFinal",
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 5, 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF6080A7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              'Semester: ${user["Semester"]}',
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
                              'Department: ${user["Department"]}',
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
