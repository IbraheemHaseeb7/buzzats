import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:flutter_app_1/pages/SuggestionPage.dart';
import 'package:http/http.dart' as http;
import '../CustomWidgets/UserSuggest.dart';
import 'Userlist.dart';

String? batchFinal;
String query = 'test';
double? screenWidth;

class SearchMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchUser(),
    );
  }
}

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUser();
}

class _SearchUser extends State<SearchUser> {
  Timer? _debounce;

  final TextEditingController _queryController = TextEditingController();

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
                padding: EdgeInsets.fromLTRB(18, 0, 0, 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuggestionPage()),
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 38,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(35, 15, 10, 20),
                  child: TextField(
                    controller: _queryController,
                    autofocus: true,
                    onChanged: (text) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();

                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        setState(() {
                          query = text;
                          print(query);
                        });
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
                      contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      prefixIcon: const Icon(Icons.search,
                          color: Color(0xffffffff), size: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder<List<Userlist>>(
            future: searchUser(query: query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  children: [
                    TweetSkeleton(),
                    TweetSkeleton(),
                    TweetSkeleton(),
                    TweetSkeleton(),
                    TweetSkeleton(),
                    TweetSkeleton(),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No users found.');
              } else {
                List<Userlist>? data = snapshot.data;
                return Column(
                  children: data!.map((user) {
                    return userGet(
                      user.email!,
                      user.bytes,
                      user.name!,
                      user.department!,
                      user.semester!,
                    );
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

Future<List<Userlist>> searchUser({String? query}) async {
  List<Userlist> users = [];

  query = query!.toLowerCase();
  const url = 'https://great-resonant-year.glitch.me/query';
  final headers = {'Content-Type': 'application/json'};
  final body = {
    'query': "select * from [tb_Userprofile] u WHERE u.Name LIKE '%$query%';"
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);

    List<dynamic> usersData = data['data'];

    users = usersData
        .where((element) => element['Name'].toLowerCase().contains(query))
        .map((userJson) => Userlist.fromJson(userJson))
        .toList();
  }

  return users;
}

Stack userGet(String email, Uint8List? bytes, String name, String department,
    int semester) {
  batchFinal = email!.substring(0, 4);
  batchFinal = batchFinal!.toUpperCase();

  return Stack(children: [
    Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: screenWidth,
      height: 120,
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
