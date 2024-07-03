import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class Comments {
  static List<dynamic> replies = [];

  static void storeReplies(List<dynamic> t) async {
    await Main.localStorage.write(key: "replies", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchReplies() async {
    return jsonDecode(await Main.localStorage.read(key: "replies") ?? "[]");
  }

  static Future<dynamic> isEmpty() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "replies") ?? "[]");
    return temp == "" || temp!.length == 0;
  }
}
