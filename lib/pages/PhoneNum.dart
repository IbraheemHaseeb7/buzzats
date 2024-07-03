
// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Services/AuthService.dart';
import 'package:flutter_app_1/pages/Signup.dart';
import 'package:http/http.dart' as http;
import '../CustomWidgets/CustomDropDownMenu.dart';
import 'Home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: PhoneNumber(),
  ));
}

int ?selectedSemester;
String ?selectedSection;
TextEditingController recoveryEmailController = TextEditingController();
TextEditingController bioController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    // String q =
    //     "select us.[Name] from tb_UserProfile us where us.UserID = '${UserData.id}'";
    double screenWidth = MediaQuery.of(context).size.width;
    List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

    // void Name() {
    //   query(q).then((value) => name = value.toString());
    // }

    return Scaffold(
        backgroundColor: const Color(0xff141d26),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
                  child: const Text("Welcome to Buzzats",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 50,
                        color: Color(0xffffffff),
                      ))),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  "Set up your profile to get buzzin",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xffa099fc),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  "lib\\Assets\\profile.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 10),
                width: screenWidth - 50,
                child: TextFormField(
                  controller: phoneController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110)),
                    hintText: "03XXXXXXXXX",
                    labelStyle: const TextStyle(color: Colors.white),
                    floatingLabelStyle: const TextStyle(color: Color(0xffa099fc)),
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              )),
              Center(
                child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: screenWidth - 50,
                child: TextFormField(
                  controller: recoveryEmailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110)),
                    hintText: "kuch@bhi.com",
                    labelStyle: const TextStyle(color: Colors.white),
                    floatingLabelStyle: const TextStyle(color: Color(0xffa099fc)),
                    labelText: "Recovery Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              )),
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: screenWidth - 50,
                child: TextFormField(
                  controller: bioController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110)),
                    hintText: "Describe yourself to the whole community...",
                    labelStyle: const TextStyle(color: Colors.white),
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xffa099fc)),
                    labelText: "Buzzio",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              )),
              CustomDropdown(
                width: screenWidth - 50,
                items: semesters.map((e) => e.toString()).toList(),
                value: "1", // Pass the selected value here
                onChanged: (newValue) {
                  // Handle dropdown value changes here
                    selectedSemester = int.parse(newValue!);
                  
                },
                labelText: "Semester",
              ),

              CustomDropdown(
                width: screenWidth - 50,
                items: const ['A','B','C','D'],
                value: "A", 
                onChanged: (newValue) {
                    selectedSection = newValue;
                  
                },
                labelText: "Section",
              ),
              Center(
                child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: screenWidth - 50,
                    child: ElevatedButton(
                      onPressed: () async {

                        await addUser(SignupState.emailController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(102, 26, 255, 0.612)),
                        foregroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 255, 255, 1)),
                        fixedSize: MaterialStateProperty.all(const Size(400, 55)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                      ),
                      child: const Text("Let's Buzzz!!"),
                    )),
              ),
            ],
          ),
        ));
  }

}

Future<void> addUser(String email) async {
  String? userID;
  String name = await AuthService.getCurrentUser()!.userMetadata!['name'];
  String recoveryEmail = recoveryEmailController.text;
  String? department;
  String departmentRec;
  int? semester = selectedSemester;
  String bio = bioController.text;
  String? deviceID = await getDeviceId();
  String? token = await getDeviceToken();
  String image = '';  
  String createdAt = DateTime.now().toIso8601String();
  String phoneNumber = phoneController.text;  

  var temp = email;
  List tempId = temp.split('-');
  List last = tempId[2].split('');
  userID = tempId[0] + tempId[1] + last[0] + last[1] + last[2];


  departmentRec = email.substring(5, 8);

  switch (departmentRec.toUpperCase()) {
    case "BCS":
      department = "Computer Science";
      break;
    case "BSE":
      department = "Software Engineering";
      break;
    case "BAI":
      department = "Artificial Intelligence";
      break;
    case "BCE":
      department = "Computer Engineering";
      break;
    case "BAF":
      department = "Accounting & Finance";
      break;
    case "BAR":
      department = "Architecture";
      break;
    case "BBA":
      department = "Business Administration";
      break;
    case "BDE":
      department = "Design";
      break;
    case "BCM":
      department = "Media and Communication Studies";
      break;
    case "BEE":
      department = "Electrical Engineering";
      break;
    case "BPH":
      department = "Physics";
      break;
    case "BPY":
      department = "Psychology";
      break;
    case "BID":
      department = "Interior Design";
      break;
    case "BEC":
      department = "Economics";
      break;
    case "BSM":
      department = "Mathematics";
      break;
    case "BST":
      department = "Statistics";
      break;
    case "BEN":
      department = "English";
      break;
    case "CHE":
      department = "Chemical Engineering";
      break;

    default:
      break;
  }


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
      'email': email,
      'recovery_email': recoveryEmail,
      'department': department,
      'semester': semester,
      'bio': bio,
      'device_id': deviceID,
      'token': token,
      'section': selectedSection,
      'image': image,
      'created_at': createdAt,
      'phone_number': phoneNumber,
    }),
  );

  if (response.statusCode == 200) {
    print('User added successfully');
  } else {
    print('Failed to add user: ${response.body}');
  }
}

  


Future<String?> getDeviceId() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  
  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.id; 
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    return iosInfo.identifierForVendor; 
  }
  
  return null;
}


Future<String?> getDeviceToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission();
  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    String? token = await messaging.getToken();
    return token;
  } else {
    print('Permission not granted');
    return null;
  }
}
