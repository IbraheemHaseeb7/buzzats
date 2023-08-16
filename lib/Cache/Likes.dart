import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class Likes {
  static List<dynamic> likes = [];

  static void storeLikes(List<dynamic> t) async {
    await Main.localStorage.write(key: "likes", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchLikes() async {
    return jsonDecode(await Main.localStorage.read(key: "likes") ?? "[]");
  }

  static Future<dynamic> isEmpty() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "likes") ?? "[]");
    return temp == "" || temp!.length == 0;
  }
}
