
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

import '../Cache/UserProfile.dart';

class Replying extends StatefulWidget {
  String twtId;
  PersistentBottomSheetController? bottomsheet;
  Replying({super.key, required this.twtId, this.bottomsheet});

  @override
  ReplyingState createState() => ReplyingState();
}

class ReplyingState extends State<Replying> {
  TextEditingController cmnt = TextEditingController();

  final enabledStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final disabledStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 123, 123, 123),
  );

  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    cmnt.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isEmpty = cmnt.text.isEmpty;
    });
  }

  @override
  void dispose() {
    cmnt.dispose();
    cmnt.removeListener(updateButtonState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 33, 47, 61),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(16), // Adjust the padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
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
                controller: cmnt,
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
                    onTap: isEmpty
                        ? null
                        : () async {
                            UserData();
                            ToasterController toasterController =
                                ToasterController();
                            ToastMe(
                                    text: "Posting",
                                    type: ToasterType.Loading,
                                    controller: toasterController)
                                .showToast(context);
                            String twt = cmnt.text;
                            socketQuery(
                                    "insert into tb_Comment values ('${widget.twtId}' ,'${UserData.id}', '$twt', GETDATE())")
                                .then((v) {
                              toasterController.end();
                              ToastMe(
                                      text: "Posted",
                                      type: ToasterType.Check,
                                      duration: 2000)
                                  .showToast(context);
                            }).catchError((err) {
                              toasterController.end();
                              ToastMe(
                                      text: "Error Occurred",
                                      type: ToasterType.Error,
                                      duration: 2000)
                                  .showToast(context);
                            });
                          },
                    child: Text(
                      "Post",
                      style: isEmpty ? disabledStyle : enabledStyle,
                    ),
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
