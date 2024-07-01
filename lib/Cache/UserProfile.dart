import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_app_1/main.dart';

class UserData {
  var temp = Main.auth.currentUser!.email ?? "";
  static String? id;
  UserData() {
    List tempId = temp.split('-');
    List last = tempId[2].split('');
    id = tempId[0] + tempId[1] + last[0] + last[1] + last[2];
  }

  static List<dynamic> user = [];

  static void storeUser(List<dynamic> t) async {
    await Main.localStorage.write(key: "user", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchUser() async {
    user = jsonDecode(await Main.localStorage.read(key: "user") ?? "[]");
    return user;
  }

  static Future<dynamic> isEmpty() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "user") ?? "[]");
    return temp == "" || temp!.length == 0;
  }

  static Future getImage() async {
    var img = jsonDecode(await Main.localStorage.read(key: "user") ?? "[]")[0]
        ["Image"]["data"];
    var bytes = Uint8List.fromList(List<int>.from(img));
    return bytes;
  }
}
