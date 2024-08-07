// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter_app_1/Cache/Feed.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/pages/HomeShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/CustomWidgets/Imagepicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconly/iconly.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class CreateTweet extends StatefulWidget {
  const CreateTweet({super.key});

  @override
  CreateTweetState createState() => CreateTweetState();
}

class CreateTweetState extends State<CreateTweet> {
  List<File> images = [];
  TextEditingController tweetController = TextEditingController();
  bool isButtonDisabled = true;
  var twtLimit = "500";
  var img;

  @override
  void initState() {
    super.initState();
    UserData();
    UserData.getImage().then((value) {
      setState(() {
        img = value;
      });
    });

    tweetController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    tweetController.removeListener(updateButtonState);
    tweetController.dispose();
    super.dispose();
  }

  void updateButtonState() {
    setState(() {
      isButtonDisabled = tweetController.text.isEmpty;
    });
  }

  void updateTwtLimit() {
    setState(() {
      twtLimit = (500 - tweetController.text.length).toString();
    });
  }

  void onPickImages() async {
    images = await pickImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final enabledStyle = ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
      backgroundColor: MaterialStateProperty.all(Color(0xFF4137BD)),
      fixedSize: MaterialStateProperty.all(Size(80, 80)),

      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      )),
    );

    final disabledStyle = ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
      backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 78, 72, 160).withOpacity(0.13)),
      fixedSize: MaterialStateProperty.all(Size(80, 80)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      )),
    );

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(
        backgroundColor: Color(0xFF141D26),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(150, 183, 223, 1),
        ),
        centerTitle: true,
        title: Text(
          "Create a Tweet",
          style: TextStyle(
            color: Color.fromRGBO(150, 183, 223, 1),
            fontSize: 17,
          ),
        ),
        actions: const [],
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12, left: 12, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    child: img == null
                        ? Container()
                        : Image.memory(
                            img,
                            width: 50,
                          ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 12, left: 12),
                  width: screenWidth - 90,
                  child: TextFormField(
                    cursorColor: Colors.blue,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 251, 251)),
                    onChanged: (value) {
                      setState(() {
                        twtLimit = (500 - value.length).toString();
                      });
                    },
                    maxLength: 500,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: tweetController,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      counterText: "$twtLimit characters left",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 110, 110, 110)),
                      hintText: "What's buzzin'?",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 143, 143, 143)),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                //we cannot show the images on flutter web but it will working
              ],
            ),
            if (images.isNotEmpty)
              CarouselSlider(
                items: images
                    .map((file) => Image.file(
                          file,
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options:
                    CarouselOptions(height: 400, enableInfiniteScroll: false),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF141D26),
          // Optional: Add background color
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Border color
              width: 0.4, // Border width
            ),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onPickImages,
              icon: Icon(
                IconlyLight.image,
                color: Colors.white,
              ),
              alignment: Alignment.centerLeft,
              iconSize: 40,
            ),
            SizedBox(width: screenWidth - 160),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 8,
                  left: 8), // Adjust horizontal padding

              child: ElevatedButton(
                onPressed: isButtonDisabled
                    ? null
                    : () async {
                        ToasterController toasterController =
                            ToasterController();
                        ToastMe(
                                text: "Posting",
                                type: ToasterType.Loading,
                                controller: toasterController)
                            .showToast(context);
                        String twt = tweetController.text;
                        socketQuery(
                                "begin tran declare @temp varchar(10); set @temp = (select concat('T', count(TweetID) + 1) from tb_Tweets); insert into tb_Tweets (TweetID, UserID, Tweet, [Date/Time]) values (@temp, '${UserData.id}', '$twt', GETDATE()) commit")
                            .then((v) {
                          toasterController.end();
                          ToastMe(
                                  text: "Posted",
                                  type: ToasterType.Check,
                                  duration: 2000)
                              .showToast(context);
                          Navigator.pop(context);
                          UserData.fetchUser().then((user) {
                            setState(() {
                              HomeShowState.tweets.add({
                                "HasLiked": false,
                                "TweetID": "TEMP",
                                "Name": user[0]["Name"],
                                "Image": user[0]["Image"],
                                "time": DateTime.now(),
                                "Tweet": twt,
                                "replies": 0,
                                "likes": 0
                              });
                            });

                            query("select Image as [image], id.[UserID], id.[Name],twt.TweetID,twt.Tweet, twt.[Date/Time] as [time], (select count(t.TweetID) from tb_Like t where t.TweetID = twt.TweetID ) as likes, (select isnull('yes','no') from tb_Like tl where tl.TweetID=twt.TweetID and tl.UserID='${UserData.id}') as 'HasLiked', (select count(c.TweetID) from tb_Comment c  where c.TweetID = twt.TweetID) as replies from tb_UserProfile id inner join tb_Tweets twt on id.UserID = twt.UserID order by [time] desc")
                                .then((value) {
                              setState(() {
                                Feed.storeTweets(value);
                                HomeShowState.tweets = value;
                              });
                            });
                          });
                        }).catchError((err) {
                          toasterController.end();
                          ToastMe(
                                  text: "Error Occurred",
                                  type: ToasterType.Error,
                                  duration: 2000)
                              .showToast(context);
                        });
                      },
                style: isButtonDisabled ? disabledStyle : enabledStyle,
                child: Text(
                  "Buzzit!",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold), // Adjust font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
