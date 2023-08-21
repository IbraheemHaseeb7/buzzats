import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Classes/User.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';

import 'EditProfile.dart';



class SearchedUser extends UserProfile {
  SearchedUser({super.key, required super.myself});

    @override
  createState() => SearchedUserState();

}


class SearchedUserState extends UserProfileState {

  bool isPressed = false;
  int count = 0;

  final enabledStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
        const Color.fromARGB(255, 33, 243, 117) // Default background color

        ),
    foregroundColor: MaterialStatePropertyAll(Colors.transparent),
    fixedSize: MaterialStatePropertyAll(Size(95, 10)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    )),
  );


  final disabledStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
        Color(0xFF5F80A6)), // Default background color

    foregroundColor: MaterialStatePropertyAll(Colors.transparent),
    fixedSize: MaterialStatePropertyAll(Size(95, 10)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    )),
  );

  @override
  Column generateButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {

            setState(() {
              count = (count + 1) % 2;
              if (count == 1) {
                isPressed = true;
              }
              if (count == 0) {
                isPressed = false;
              }
            });
          },
          style: isPressed ? enabledStyle : disabledStyle,
          child: Text(
            isPressed ? "Connected" : "Connect",
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            foregroundColor: MaterialStatePropertyAll(Colors.transparent),
            fixedSize: MaterialStatePropertyAll(Size(95, 10)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: Color(0xFF5F80A6),
              ),
            )),
          ),
          child: Text(
            "Message",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

// <<<<<<< HEAD
//   @override
//   void dispose(){
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //screenheight and width
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("${widget.name}"),
//           backgroundColor: const Color(0xFF141D26),
//         ),
//         body: Container(
//           width: screenWidth,
//           height: screenHeight,
//           decoration: const BoxDecoration(color: Color(0xFF141D26)),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25, top: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Container(
//       width: 185,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "${widget.name}",
//             textAlign: TextAlign.left,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5), // Adding spacing between text and icon
//         ],
//       ),
//     ),
//     const Icon(Icons.verified_rounded, color: Colors.blue),
//   ],
// ),

//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(
//                                       5.0), // Add padding to create space around the texts

//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "$connections",
//                                         textAlign: TextAlign.left,
//                                         style: const TextStyle(
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                           height:
//                                               4), // Add some space between the texts
//                                       const Text(
//                                         "Connections",
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 15),
//                               Container(
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(
//                                       8.0), // Add padding to create space around the texts
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "7",
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                           height:
//                                               4), // Add some space between the texts
//                                       Text(
//                                        "Mutuals",
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           SizedBox(
//                             width: screenWidth - 200,
//                             child: Text(
//                               "${widget.bio}",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white.withOpacity(0.6),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       Column(
//                         children: [
//                           ClipRRect(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(200)),
//                             child: widget.bytes != null
//                                 ? Image.memory(widget.bytes!, width: 90)
//                                 : const CircularProgressIndicator(),
//                           ),
//                           const SizedBox(height: 20),
//                           generateButtons()
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       bottom: 16.0, top: 2, left: 16, right: 16),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 11, top: 4),
//                     width: screenWidth,
//                     height: 120,
//                     decoration: const BoxDecoration(
//                         border: Border(
//                             top: BorderSide(color: Colors.grey),
//                             bottom: BorderSide(color: Colors.grey))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "About",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           "Registration Number: ${widget.regNo}",
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           "Batch: ${widget.batch}",
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         Text(
//                           "Semester: ${widget.semester}",
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         Text(
//                           "Department: ${widget.department}",
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.only(top: 10),
//                   width: screenWidth,
//                   child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 5,
//                             bottom: 20,
//                           ),
//                           child: SizedBox(
//                             height: 30,
//                             width: screenWidth * 0.3,
//                             child: OutlinedButton(
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           tweetButtonColor)),
//                               onPressed: handleTweet,
//                               child: const Text(
//                                 "Tweets",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 5, bottom: 20),
//                           child: SizedBox(
//                             height: 30,
//                             width: screenWidth * 0.3,
//                             child: OutlinedButton(
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           replierButtonColor)),
//                               onPressed: handleReplies,
//                               child: const Text(
//                                 "Replies",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                             ),
//                           ),
//                         )
//                       ]),
//                 ),
//                 Column(
//                   children: isFetched
//                       ? tweets
//                           .map((e) => TweetWidget(
//                             twtId: e["TweetID"],
//                               id: "fa21bcs140",
//                               name: e["Name"],
//                               image: e["image"]["data"],
//                               time: DateTime.parse(e["time"]).day ==
//                                       DateTime.now().day
//                                   ? DateTime.parse(e["time"]).hour.toString() +
//                                       ":" +
//                                       DateTime.parse(e["time"])
//                                           .minute
//                                           .toString()
//                                   : DateTime.parse(e["time"]).day.toString() +
//                                       DateFormat.MMM()
//                                           .format(DateTime.parse(e["time"])),
//                               content: e["Tweet"],
//                               repliesCount: 2,
//                               likesCount: 6))
//                           .toList()
//                       : [
//                           const TweetSkeleton(),
                        
//                         ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
// =======
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();

  }
}
