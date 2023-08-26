import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_app_1/CustomWidgets/SocietySuggest.dart';
import 'package:flutter_app_1/CustomWidgets/UserSuggest.dart';
import 'package:flutter_app_1/Skeletons/SuggestSocSkel.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_app_1/pages/SearchUser.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import '../Cache/Suggestions.dart';
import 'Userlist.dart';

class SuggestionPage extends StatefulWidget {
  SuggestionPage({super.key});
  String? userID;
  String? name;
  String? email;
  String? recoveryEmail;
  String? department;
  String? departmentRec;
  String? batch;
  int? semester;
  String? bio;
  Uint8List? bytes;

  @override
  State<SuggestionPage> createState() => _SuggestionPage();
}

class _SuggestionPage extends State<SuggestionPage> {
  Color peopleColor = const Color(0xFF4137BD);
  Color societyColor = const Color(0xffffffff);

  // Add a GlobalKey to the RefreshIndicator
  final GlobalKey<RefreshIndicatorState> _refreshPeopleKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshSocietyKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _handlePeopleRefresh() async {
    // After refreshing the data, call setState to rebuild the UI if needed.
    setState(() {});
  }

  Future<void> _handleSocietyRefresh() async {
    // After refreshing the data, call setState to rebuild the UI if needed.
    setState(() {});
  }

  bool showPeopleWidgets = true;
  bool showSocietyWidgets = false;
  bool showPeopleButton = true;
  bool showSocietyButton = true;
  bool showSuggestionsText = true;

  String q =
      "select (select count(*) from tb_SocietyMembers mem where mem.SocietyID = soc.SocietyID) as members, soc.SocietyID, (select [Name] from tb_UserProfile u where u.[UserID]=soc.PresidentID) as President, soc.PresidentID,soc.About, soc.Picture, soc.SocietyName from tb_Society soc";

  String q2 = "select top 2 * from tb_UserProfile tb order by newId()";

  List<dynamic> people = [];
  List<dynamic> societies = [];
  bool isSoc = false;
  bool isPeople = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff141d26),
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
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 15, 10, 20),
                  child: TextField(
                    controller: TextEditingController(),
                    readOnly: true,
                    obscureText: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchUser()),
                      );
                    },
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
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
                      fillColor: Color.fromARGB(36, 73, 72, 99),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      prefixIcon: const Icon(IconlyLight.search,
                          color: Color(0xffffffff), size: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 0, 10),
                child: Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Text(
                    "Suggestions for you ",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                    child: Align(
                      alignment: const Alignment(-0.9, 0.0),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            // Reduce the font size by a certain amount when the button is pressed
                            peopleColor = const Color(0xFF4137BD);
                            societyColor = const Color(0xffffffff);

                            showPeopleWidgets = true;
                            showSocietyWidgets = false;
                          });
                        },
                        color: const Color(0x00ffffff),
                        elevation: 0,
                        shape: Border(
                            bottom: BorderSide(
                          color: showPeopleWidgets
                              ? const Color(0xFF4137BD)
                              : Colors.transparent, // Bottom border color
                          width: 2.0, // Border width
                        )),
                        padding: const EdgeInsets.all(0),
                        textColor: peopleColor,
                        height: 40,
                        minWidth: 100,
                        child: const Text(
                          "People",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 20, 0, 20),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          // Reduce the font size by a certain amount when the button is pressed
                          societyColor = const Color(0xFF4137BD);
                          peopleColor = const Color(0xffffffff);
                          showSocietyWidgets = true;
                          showPeopleWidgets = false;
                        });
                      },
                      color: const Color(0x00ffffff),
                      elevation: 0,
                      shape: Border(
                        bottom: BorderSide(
                          color: showSocietyWidgets
                              ? const Color(0xFF4137BD)
                              : Colors.transparent, // Bottom border color
                          width: 2.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      textColor: societyColor,
                      height: 40,
                      minWidth: 100,
                      child: const Text(
                        "Society",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          showPeopleWidgets
              ? Expanded(
                  child: RefreshIndicator(
                    key: _refreshPeopleKey,
                    onRefresh: _handlePeopleRefresh,
                    child: SingleChildScrollView(
                      child: FutureBuilder<List<dynamic>>(
                        future: socketQuery(q2),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Column(
                              children: [
                                TweetSkeleton(),
                                TweetSkeleton(),
                                TweetSkeleton(),
                                TweetSkeleton(),
                                TweetSkeleton(),
                              ],
                            ); // Show shimmer loading
                          } else if (snapshot.hasError) {
                            // Handle error case
                            return Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(color: Colors.white),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            // Show empty state
                            return const Text(
                              'No users found.',
                              style: TextStyle(color: Colors.white),
                            );
                          } else {
                            List<dynamic> data = snapshot.data!;
                            return Column(
                              children: data.map((user) {
                                return userGet(
                                  user["Email"] ?? "",
                                  user["Image"],
                                  user["Name"] ?? "",
                                  user["Department"] ?? "",
                                  user["Semester"] ?? "",
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: RefreshIndicator(
                    key: _refreshSocietyKey,
                    onRefresh: _handleSocietyRefresh,
                    child: SingleChildScrollView(
                      child: FutureBuilder<List<dynamic>>(
                        future: socketQuery(q),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Column(
                              children: [
                                SuggestSocSkel(),
                                SuggestSocSkel(),
                              ],
                            ); // Show shimmer loading
                          } else if (snapshot.hasError) {
                            // Handle error case
                            return Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(color: Colors.white),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            // Show empty state
                            return const Text(
                              'No societies found.',
                              style: TextStyle(color: Colors.white),
                            );
                          } else {
                            List<dynamic> data = snapshot.data!;
                            return Column(
                                children: data.map((s) {
                              return SocietySuggest(
                                  image: s["Picture"],
                                  president: s["President"],
                                  presidentId: s["PresidentID"],
                                  id: s["SocietyID"],
                                  name: s["SocietyName"],
                                  about: s["About"],
                                  connections: s["members"]);
                            }).toList());
                          }
                        },
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Future<List<dynamic>> suggestSoc(String q) async {
    List<dynamic> soc = [];

    const url = 'https://great-resonant-year.glitch.me/query';
    final headers = {'Content-Type': 'application/json'};
    final body = {'query': q};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        soc = data['data'];
        print(soc);

        return soc;
      } else {
        return soc;
      }
    } catch (e) {
      return soc;
    }
  }

  Future<List<Userlist>?> showSuggestions(String q2) async {
    List<Userlist>? users;

    final url = 'https://great-resonant-year.glitch.me/query';
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'query': q2,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<dynamic> usersData = data['data'];

      users = usersData.map<Userlist>((userData) {
        return Userlist.fromJson(userData);
      }).toList();
    }

    return users;
  }

  GestureDetector userGet(String email, Uint8List? bytes, String name,
      String department, int semester) {
    batchFinal = email!.substring(0, 4);
    batchFinal = batchFinal!.toUpperCase();

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => UserProfile(myself: false)));
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Color(0x00474747),
            shape: BoxShape.rectangle,
            border: Border(top: BorderSide(color: Color(0xff6080a7), width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 0),
                child: Container(
                  height: 90,
                  width: 70,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: bytes != null
                      ? Image.memory(bytes, width: 200, height: 200)
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        name,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF6080A7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          'Semester: $semester',
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
                          'Department: $department',
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
        ));
  }
}
