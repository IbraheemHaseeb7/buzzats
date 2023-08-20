import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:flutter_app_1/pages/EditProfile.dart';
import '../Cache/query.dart';
import 'package:intl/intl.dart';

String userID = "";
String email = "";
Uint8List? bytes;
String bio = "";
String name = "Buzzats User";
String department = "";
String departmentRec = "";
int semester = 0;
String regNo = "";
String batch = "";

class UserProfile extends StatefulWidget {
  bool myself;
  UserProfile({super.key, required this.myself});

  @override
  createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Color tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
  Color replierButtonColor = const Color(0xff141D26);
  bool isTweetsDisplayed = true;

  final GlobalKey<RefreshIndicatorState> _refreshPeopleKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshSocietyKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _handlePeopleRefresh() async {
    setState(() {});
  }

  Future<void> _handleSocietyRefresh() async {
    setState(() {});
  }

  List<dynamic> tweets = [];
  bool isFetched = false;
  int connections = 0;

  String q1 =
      "SELECT (select isNull('yes', 'no') as 'HasLiked' from tb_Like tl where tl.UserID=id.UserID and tl.TweetID = twt.TweetID) as 'HasLiked', id.UserID, id.[Name], twt.TweetID, twt.Tweet, twt.[Date/Time] AS [time] FROM tb_UserProfile id INNER JOIN tb_Tweets twt ON id.UserID = twt.UserID WHERE id.userID ='$userID' order by [time] desc";

  String q2 =
      "select count(FriendUserID) As 'connections' from tb_Friends where UserID='$userID'";

  String q3 = "select * from [tb_Userprofile] u WHERE u.userID='$userID'";

  @override
  void initState() {
    if (widget.myself) {
      UserData();
      UserData.fetchUser().then((value) async {
        final tweetsValue = await query(
            "SELECT (select count(t.TweetID) from tb_Like t where t.TweetID = twt.TweetID ) as likes, (select isNull('yes', 'no') as 'HasLiked' from tb_Like tl where tl.UserID=id.UserID and tl.TweetID = twt.TweetID) as 'HasLiked', (select count(c.TweetID) from tb_Comment c  where c.TweetID = twt.TweetID) as replies, id.UserID, id.[Name], twt.TweetID, twt.Tweet, twt.[Date/Time] AS [time] FROM tb_UserProfile id INNER JOIN tb_Tweets twt ON id.UserID = twt.UserID WHERE id.userID ='${UserData.id}' order by [time] desc");
        setState(() {
          name = value[0]["Name"];
          userID = value[0]["UserID"];
          bytes = Uint8List.fromList(List<int>.from(value[0]["Image"]["data"]));
          bio = value[0]["BIO"];
          regNo =
              "${value[0]["UserID"].toString().substring(0, 4)}-${value[0]["UserID"].toString().substring(4, 7)}-${value[0]["UserID"].toString().substring(7, 10)}";
          batch = value[0]["UserID"].toString().substring(0, 4).toUpperCase();
          semester = value[0]["Semester"];
          department =
              value[0]["UserID"].toString().substring(4, 7).toUpperCase();
          connections = value[0]["Connections"];
          tweets = tweetsValue;
          isFetched = true;
        });
      });
    } else {
      loadData();
    }
  }

  Future<void> loadData() async {
    try {
      final tweetsValue = await query(q1);
      final connectionsValue = await query(q2);
      final users = await query(q3);
      Map<String, dynamic> userConnections = connectionsValue[0];
      Map<String, dynamic> userData = users[0];
      final imageBuffer = userData['Image']['data'];
      final imageBytes = Uint8List.fromList(
          List<int>.from(imageBuffer.map((dynamic element) => element as int)));

      setState(() {
        tweets = tweetsValue;
        connections = userConnections["connections"];
        isFetched = true;

        userID = userData["UserID"];
        email = userData["Email"];
        name = userData["Name"];
        department = userData["Department"] ?? "Unknown";
        semester = userData["Semester"] ?? "Unknown";
        bio = userData["BIO"] ?? "Unknown";
        bytes = imageBytes;

        batch = email.substring(0, 4).toUpperCase();

        regNo = email!.substring(0, 12).toUpperCase();
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  void handleTweet() {
    setState(() {
      tweetButtonColor = const Color.fromARGB(66, 96, 128, 167);
      replierButtonColor = const Color(0xff141D26);
      isTweetsDisplayed = true;
    });
  }

  void handleReplies() {
    setState(() {
      replierButtonColor = const Color.fromARGB(66, 96, 128, 167);
      tweetButtonColor = const Color(0xff141D26);
      isTweetsDisplayed = false;
    });
  }

  Column generateButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditProfile(), // Replace with the screen you want to navigate to
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Color(0xFF5F80A6)),
            foregroundColor: const MaterialStatePropertyAll(Colors.transparent),
            fixedSize: const MaterialStatePropertyAll(Size(80, 10)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
          ),
          child: const Text(
            "Edit",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //screenheight and width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(regNo.toUpperCase()),
          backgroundColor: const Color(0xFF141D26),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(color: Color(0xFF141D26)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                child: Text(
                                  "$name",
                                  textAlign: TextAlign.left,
                                  maxLines: null,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(Icons.verified_rounded,
                                  color: Colors.blue)
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      5.0), // Add padding to create space around the texts

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "$connections",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                          height:
                                              4), // Add some space between the texts
                                      const Text(
                                        "Connections",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                child: const Padding(
                                  padding: EdgeInsets.all(
                                      8.0), // Add padding to create space around the texts
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "0",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              4), // Add some space between the texts
                                      Text(
                                        "Mutuals",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: screenWidth - 200,
                            child: Text(
                              "$bio",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(200)),
                            child: bytes != null
                                ? Image.memory(bytes!, width: 90)
                                : const CircularProgressIndicator(),
                          ),
                          const SizedBox(height: 20),
                          generateButtons()
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0, top: 2, left: 16, right: 16),
                  child: Container(
                    padding: const EdgeInsets.only(left: 11, top: 4),
                    width: screenWidth,
                    height: screenHeight - 730,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "About",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Registration Number: $regNo",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Batch: $batch",
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Semester: $semester",
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Department: $department",
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            bottom: 20,
                          ),
                          child: SizedBox(
                            height: 30,
                            width: screenWidth * 0.3,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          tweetButtonColor)),
                              onPressed: handleTweet,
                              child: const Text(
                                "Tweets",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 20),
                          child: SizedBox(
                            height: 30,
                            width: screenWidth * 0.3,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          replierButtonColor)),
                              onPressed: handleReplies,
                              child: const Text(
                                "Replies",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                Column(
                  children: isFetched
                      ? tweets
                          .map((e) => TweetWidget(
                              isLiked: e["HasLiked"] == "yes",
                              twtId: e["TweetID"],
                              id: UserData.id ?? "",
                              name: e["Name"],
                              image: bytes,
                              time: DateTime.parse(e["time"]).day ==
                                      DateTime.now().day
                                  ? DateTime.parse(e["time"]).hour.toString() +
                                      ":" +
                                      DateTime.parse(e["time"])
                                          .minute
                                          .toString()
                                  : DateTime.parse(e["time"]).day.toString() +
                                      DateFormat.MMM()
                                          .format(DateTime.parse(e["time"])),
                              content: e["Tweet"],
                              repliesCount: e["replies"],
                              likesCount: e["likes"]))
                          .toList()
                      : [
                          const TweetSkeleton(),
                          const TweetSkeleton(),
                          const TweetSkeleton(),
                        ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
