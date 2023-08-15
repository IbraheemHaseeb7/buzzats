import 'dart:typed_data';

class Userlist {
  String? userID;
  String? name;
  String? email;
  String? department;
  String? batch;
  int? semester;
  String? bio;
  Uint8List? bytes;
  String? deviceID;
  String? token;

  Userlist(
      {this.userID,
      this.name,
      this.email,
      this.department,
      this.batch,
      this.semester,
      this.bio,
      this.bytes,
      this.deviceID,
      this.token});

  Userlist.fromJson(Map<String, dynamic> json) {
    userID = json["UserID"];
    name = json["Name"];
    department = json["Department"] ?? "Unknown";
    semester = json["Semester"] ?? 0; // Use a default value
    email = json["Email"] ?? "Unknown";
    bio = json["BIO"] ?? "Unknown";
    deviceID = json["DeviceID"] ?? "Unknown";
    token = json["token"] ?? "Unknown";
    final imageBuffer = json['Image']['data'];
    final imageBytes = Uint8List.fromList(List<int>.from(imageBuffer));
    bytes = imageBytes;

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['UserID'] = userID;
      data['Name'] = name;
      data['Department'] = department;
      data['Semester'] = semester;
      data['Email'] = email;
      data['BIO'] = bio;
      data['DeviceID'] = deviceID;
      data['Token'] = token;
      data['Image'] = bytes;

      return data;
    }
  }
}