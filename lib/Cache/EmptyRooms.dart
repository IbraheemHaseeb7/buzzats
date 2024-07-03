import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class EmptyRooms {
  static List<dynamic> tweets = [];

  static Future storeRooms(List<dynamic> t) async {
    await Main.localStorage.write(key: "rooms", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchRooms() async {
    return jsonDecode(await Main.localStorage.read(key: "rooms") ?? "[]");
  }

  static Future<dynamic> isEmpty() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "rooms") ?? "[]");
    return temp == "" || temp!.length == 0;
  }
}
