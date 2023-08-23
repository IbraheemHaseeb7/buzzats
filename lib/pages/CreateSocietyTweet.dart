import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/CustomWidgets/MySoc.dart';
import "package:http/http.dart" as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/CustomWidgets/Imagepicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

import '../CustomWidgets/CustomDropDownMenu.dart';

class CreateSocietyTweet extends StatefulWidget {
  String id;
  List<dynamic> groups = [];
  var image;

  CreateSocietyTweet({
    super.key,
    required this.id,
    required this.groups,
    required this.image,
  });

  @override
  CreateSocietyTweetState createState() => CreateSocietyTweetState();
}

class CreateSocietyTweetState extends State<CreateSocietyTweet> {
  List<File> images = [];
  List<String> grps = ["hbdjhfbh"];
  TextEditingController tweetController = TextEditingController();
  bool isButtonDisabled = true;
  var twtLimit = "500";
  var img,imageBytes;

  String selectedItem = 'Society Tweet';

  @override
  void initState() {
    super.initState();

       if(widget.image!=null)
    {

    imageBytes = Uint8List.fromList(List<int>.from(widget.image));
    }
    
      

    widget.groups.map((e) {
      
       setState(() {
         
          grps = e["SGroupName"];
       });
       


    });

    print(widget.groups);
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
          "Create a Society Tweet",
          style: TextStyle(
            color: Color.fromRGBO(150, 183, 223, 1),
            fontSize: 17,
          ),
        ),
        actions: [],
      ),
      body: Container(
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
                    child: Container(
                      child:  ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: widget.image == null
                    ? Image.asset(
                        "lib/Assets/profile.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                      )
                    : Image.memory(
                        imageBytes,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
              ),
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
              ],
            ),
            if (images.isNotEmpty)
              CarouselSlider(
                items: images.map((file) => Image.file(file)).toList(),
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
            SizedBox(width: 8), // Add spacing between the buttons

            Expanded(
              flex: 3,
              child: Container(
                child:  DropdownButton<String>(
            items: widget.groups.map<DropdownMenuItem<String>>(
              (value) {
                return DropdownMenuItem<String>(
                  value: value["SGroupName"],
                  child: Text(value["SGroupName"].toString()),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(() {
                
               selectedItem = newValue.toString();
              });
           
            },
            value: widget.groups.map((e) => e["SGroupName"]).toString(), // Initially selected value
            isExpanded: true, // Allow the dropdown to take up the full width
          ),
        ),
        ),
              
            

            SizedBox(width: 8), // Add spacing between the buttons

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

                        query("begin tran declare @temp varchar(10); set @temp = (select concat('ST', count(STweetID) + 1) from tb_SocietyTweets); insert into tb_SocietyTweets (STweetID, SocietyID, STweet, [Date/Time]) values (@temp, '${widget.id}', '$twt', GETDATE()) commit")
                            .then((v) {
                          toasterController.end();
                          ToastMe(
                                  text: "Posted",
                                  type: ToasterType.Check,
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
