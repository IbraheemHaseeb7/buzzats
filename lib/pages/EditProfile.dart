import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/UploadPicture.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/CustomWidgets/UserSuggest.dart';
import 'package:flutter_app_1/pages/FrostedTwt.dart';
import 'package:flutter_app_1/pages/PhoneNum.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';



import '../CustomWidgets/Imagepicker.dart';


void main() {
  runApp(const EditProfile());
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  List<File> images = [];
  bool isButtonDisabled = true;
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final semesterController = TextEditingController();
  final sectionController = TextEditingController();
  final recoveryEmailController = TextEditingController();
  final bioController = TextEditingController();
  var image;
  late int semester = 1;
  bool isImageChanged = false;

  final enabledStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
    backgroundColor: MaterialStateProperty.all(const Color(0xFF4137BD)),
    fixedSize: MaterialStateProperty.all(const Size(80, 30)),

    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    )),
  );

  final disabledStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
    backgroundColor: MaterialStateProperty.all(
        const Color.fromARGB(255, 78, 72, 160).withOpacity(0.13)),
    fixedSize: MaterialStateProperty.all(const Size(80, 30)),
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
      bioController.text = value[0]["BIO"];
      recoveryEmailController.text = value[0]["RecoveryEmail"] ?? "";

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

  

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    semesterController.dispose();
    recoveryEmailController.dispose();
    bioController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    List<String> section= ['A','B','C','D'];

    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF141D26),
          appBar: AppBar(
            backgroundColor: const Color(0xFF141D26),
            elevation: 0.5,
            title: const Text("Edit Profile"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Add the functionality to navigate back here
                Navigator.pop(
                    context); // This will pop the current route and go back
              },
            ),
            actions: const [],
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
                  const SizedBox(
                    height: 6,
                  ),
                  FrostedTwt(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.8,
                    child: Container(
                      height: 360,
                      width:
                          320, 
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
                                    style: const TextStyle(color: Colors.white),
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
                                const SizedBox(width: 10),
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
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      filled: true,
                                      alignLabelWithHint: true,
                                      labelText: "Phone Number",
                                      labelStyle: TextStyle(color: Colors.white),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 137, 137, 137)),
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
                                child: DropdownMenu(
                              controller: sectionController,
                              initialSelection: section,
                              width: screenWidth * 0.7,
                              enabled: true,
                              label: const Text("Section"),
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
                              dropdownMenuEntries: section
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
                                controller: recoveryEmailController,
                                style: const TextStyle(color: Colors.white),
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
                              child: SizedBox(
                                width: screenWidth - 50,
                                child: TextFormField(
                                  controller: bioController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: const TextStyle(color: Colors.white),
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
                      onPressed: () async {
                        editUser('fa21-bcs-103@cuilahore.edu.pk');
                      },
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
          )),
    );
  }


void editUser(String email) async {
  String? userID;
  String name = usernameController.text;
  String recoveryEmail = recoveryEmailController.text;
  String section = sectionController.text;
  int? semester = int.parse(semesterController.text);
  String bio = bioController.text;

  String image = '';  
  String phoneNumber = phoneController.text;  

  var temp = email;
  List tempId = temp.split('-');
  List last = tempId[2].split('');
  userID = tempId[0] + tempId[1] + last[0] + last[1] + last[2];

  


      //   Once the OTP will start working  // 
 
  // final supabase = Supabase.instance.client;

  // const token = supabase.auth.session.access_token;

  // then pass authorization like this in the header

  // const response = await fetch('https://your-supabase-url/register-user', {
  // method: 'POST',
  // headers: {
  //   'Content-Type': 'application/json',
  //   'Authorization': `Bearer ${token}`
  // },

  final response = await http.post(
    Uri.parse('https://ihmnenvcrzyesjpwmsdw.supabase.co/functions/v1/register-user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': userID,
      'name': name,
      'recovery_email': recoveryEmail,
      'semester': semester,
      'bio': bio,
      'section': section,
      'image': image,
      'phone_number': phoneNumber,
    }),
  );

  if (response.statusCode == 200) {
    print('User updated successfully');
  } else {
    print('Failed to update user: ${response.body}');
  }
}


}


