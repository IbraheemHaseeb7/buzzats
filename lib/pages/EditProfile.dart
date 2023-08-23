import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UploadPicture.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';
import 'package:flutter_app_1/pages/FrostedTwt.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

import '../CustomWidgets/Imagepicker.dart';

class EditProfile extends StatefulWidget {
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  List<File> images = [];
  bool isButtonDisabled = true;
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final semesterController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  var image;
  late int semester = 1;
  bool isImageChanged = false;

  final enabledStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
    backgroundColor: MaterialStateProperty.all(Color(0xFF4137BD)),
    fixedSize: MaterialStateProperty.all(Size(80, 30)),

    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    )),
  );

  final disabledStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
    backgroundColor: MaterialStateProperty.all(
        Color.fromARGB(255, 78, 72, 160).withOpacity(0.13)),
    fixedSize: MaterialStateProperty.all(Size(80, 30)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    )),
  );

  void onPickImages() async {
    images = await pickImages();

    // COMPRESSING THE IMAGE
    var result = await FlutterImageCompress.compressWithFile(
      images[0].absolute.path,
      minWidth: 100,
      minHeight: 100,
      quality: 60,
    );
    image = result;
    isImageChanged = true;

    setState(() {});
  }

  @override
  void initState() {
    UserData.fetchUser().then((value) {
      usernameController.text = value[0]["Name"];
      descriptionController.text = value[0]["BIO"];
      emailController.text = value[0]["RecoveryEmail"] ?? "";

      setState(() {
        semester = value[0]["Semester"];
        image = value[0]["Image"]["data"];
      });

      if (usernameController.text != "") {
        setState(() {
          isButtonDisabled = false;
        });
      }
    });

    super.initState();
  }

  void handleCommitChanges() async {
    final toasterController = ToasterController();
    ToastMe(
            text: "Saving Changes...",
            type: ToasterType.Loading,
            controller: toasterController)
        .showToast(context);
    UserData();
    if (isImageChanged) {
      await uploadImageToAzure(image).then((res) {
        socketQuery(
                "UPDATE tb_UserProfile SET [Name]='${usernameController.text}', BIO='${descriptionController.text}', RecoveryEmail='${emailController.text}', Semester=${semesterController.text}, [Image] = (SELECT TOP 1 BulkColumn FROM OPENROWSET( BULK 'profilepictures/$res', DATA_SOURCE = 'MyAzureBlobStorage2', SINGLE_BLOB) AS Image) WHERE UserID = '${UserData.id}';")
            .then((value) {
          ToastMe(
                  text: "Succesfully Made Changes",
                  type: ToasterType.Check,
                  duration: 2000)
              .showToast(context);
          query("SELECT COUNT(f.FriendUserID) AS 'Connections', u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section FROM tb_UserProfile u INNER JOIN tb_Friends f ON f.FriendUserID = u.UserID WHERE u.UserID = '${UserData.id}' GROUP BY u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section;")
              .then((value) {
            toasterController.end();
            UserData.storeUser(value);
          });
        });
      });
    } else {
      socketQuery(
              "UPDATE tb_UserProfile SET [Name]='${usernameController.text}', BIO='${descriptionController.text}', RecoveryEmail='${emailController.text}', Semester=${semesterController.text} WHERE UserID = '${UserData.id}';")
          .then((value) {
        ToastMe(
                text: "Succesfully Made Changes",
                type: ToasterType.Check,
                duration: 2000)
            .showToast(context);
        query("SELECT COUNT(f.FriendUserID) AS 'Connections', u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section FROM tb_UserProfile u INNER JOIN tb_Friends f ON f.FriendUserID = u.UserID WHERE u.UserID = '${UserData.id}' GROUP BY u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section;")
            .then((value) {
          toasterController.end();
          UserData.storeUser(value);
        });
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    semesterController.dispose();
    emailController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

    return Scaffold(
        backgroundColor: Color(0xFF141D26),
        appBar: AppBar(
          backgroundColor: Color(0xFF141D26),
          elevation: 0.5,
          title: Text("Edit Profile"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Add the functionality to navigate back here
              Navigator.pop(
                  context); // This will pop the current route and go back
            },
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 40),
                    child: const Text("Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 40,
                          color: Color(0xffffffff),
                        ))),
                SizedBox(
                  height: 6,
                ),
                FrostedTwt(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.8,
                  child: Container(
                    height: 360,
                    width:
                        320, // Adjust the width of the container as per your requirement
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: usernameController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    filled: true,
                                    alignLabelWithHint: true,
                                    labelText: "Username",
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 137, 137, 137)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: onPickImages,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: image == null
                                      ? Container()
                                      : Image.memory(
                                          Uint8List.fromList(
                                              List<int>.from(image)),
                                          width: 50,
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                filled: true,
                                labelText: "Phone Number",
                                alignLabelWithHint: true,
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 137, 137, 137)),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 137, 137, 137)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: DropdownMenu(
                            controller: semesterController,
                            initialSelection: semester,
                            width: screenWidth * 0.7,
                            enabled: true,
                            label: const Text("Semester"),
                            inputDecorationTheme: const InputDecorationTheme(
                                suffixIconColor: Colors.white,
                                alignLabelWithHint: true,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            textStyle: const TextStyle(color: Colors.white),
                            menuStyle: MenuStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF141D26))),
                            dropdownMenuEntries: semesters
                                .map((e) => DropdownMenuEntry(
                                    value: e,
                                    label: e.toString(),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.white),
                                    )))
                                .toList(),
                          )),
                          const SizedBox(
                            height: 7,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                filled: true,
                                labelText: "Recovery Email",
                                alignLabelWithHint: true,
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 137, 137, 137)),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Expanded(
                            child: Container(
                              width: screenWidth - 50,
                              child: TextFormField(
                                controller: descriptionController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  filled: true,
                                  labelText: "Buzzio",
                                  alignLabelWithHint: true,
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 137, 137, 137)),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 137, 137, 137)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                  width: screenWidth * 0.5,
                  height: 66,
                  child: ElevatedButton(
                    onPressed: isButtonDisabled ? null : handleCommitChanges,
                    style: isButtonDisabled ? disabledStyle : enabledStyle,
                    child: const Text(
                      "Confirm Changes",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Adjust font size
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
