import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String? userID;
String? name;
String? recoveryEmail;
String? department;
String? departmentRec;
String? batch;
int? semester;
String? bio;
Uint8List? bytes;
String? deviceID;
String? token;

void main() async {
  getUserInfo("fa21-bcs-140@cuilahore.edu.pk");
}

class UserInfoDB extends StatefulWidget {
  const UserInfoDB({super.key});

  @override
  State<UserInfoDB> createState() => _UserInfoDB();
}

class _UserInfoDB extends State<UserInfoDB> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff141d26),
        body: Center(
          child: bytes != null
              ? Image.memory(bytes!, width: 200, height: 200)
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}

Future<void> getUserInfo(String email) async {
  batch = email.substring(0, 4);

  departmentRec = email.substring(5, 8);

  switch (departmentRec!.toUpperCase()) {
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
  const url = 'https://great-resonant-year.glitch.me/query';

  final headers = {'Content-Type': 'application/json'};
  final body = {
    'query': "select * from [tb_Userprofile] u WHERE u.Email='$email';"
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);

    List<dynamic> users = data['data'];

    Map<String, dynamic> userData = users[0];

    userID = userData["UserID"];
    name = userData["Name"];
    department = userData["Department"] ?? "Unknown";
    semester = userData["Semester"] ?? "Unknown";
    recoveryEmail = userData["RecoveryEmail"] ?? "Unknown";
    bio = userData["BIO"] ?? "Unknown";
    deviceID = userData["DeviceID"] ?? "Unknown";
    token = userData["Token"] ?? "Unknown";
    final imageBuffer = data['data'][0]['Image']['data'];
    final imageBytes = Uint8List.fromList(
        List<int>.from(imageBuffer.map((dynamic element) => element as int)));

    bytes = imageBytes;
  }
  print(userID);
  print(name);
  print(department);
  print(semester);
  print(bio);
  runApp(UserInfoDB());
}
