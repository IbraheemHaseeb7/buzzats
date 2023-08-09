
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class Replying extends StatefulWidget {
  const Replying({super.key});

  @override
  ReplyingState createState() => ReplyingState();
}

class ReplyingState extends State<Replying> {

  final enabledStyle = TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            );

  final disabledStyle = TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 123, 123, 123),
            );

  bool isEmpty = true;


  
  @override
  Widget build(BuildContext context) {

      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
  child: Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 33, 47, 61),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    padding: EdgeInsets.all(16), // Adjust the padding as needed
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Reply to Abdullah's tweet",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.multiline,
            maxLines: null,
              onChanged: (value) {
                            setState(() {
                              isEmpty = value.isEmpty;
                            });
                          },
            decoration: InputDecoration(
              suffix: GestureDetector(
                child: Text(
                  "Post",
                  style: isEmpty ? disabledStyle : enabledStyle,
                ),



                onTap: isEmpty ? null : (){
                  
                  ToastMe(
                              text: "Posting",
                              type: ToasterType.Loading,
                              duration: 2000)
                          .showToast(context);
                          
                          Timer(Duration(seconds: 2), () {
                            ToastMe(
                                  text: "Posted",
                                  type: ToasterType.Check,
                                  duration: 2000)
                              .showToast(context);
                              Timer(Duration(seconds: 1), () {
                          
                            Navigator.pop(context);
                          });
                       
                      });
                  },
              ),

              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
              ),
              hintText: "Reply",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}