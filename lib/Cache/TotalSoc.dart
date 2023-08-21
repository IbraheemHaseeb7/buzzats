import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class TotalSoc {
  static List<dynamic> societies =  [];

  static void storeSoc(List<dynamic> t) async {
    await Main.localStorage.write(key: "societies", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchSoc() async {
    return jsonDecode(await Main.localStorage.read(key: "societies") ?? "[]");
  }

  static Future<dynamic> isEmpty() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "societies") ?? "[]");
    return temp == "" || temp!.length == 0;
  }
}
