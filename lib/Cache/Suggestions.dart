import 'dart:convert';

import 'package:flutter_app_1/main.dart';
import 'package:flutter_app_1/pages/Userlist.dart';

class Suggestions {
  static List<Userlist> people = [];
  static List<dynamic> societies = [];


  static void storePeople(List<Userlist>? t) async {
    await Main.localStorage.write(key: "people", value: jsonEncode(t));
  }

  static void storeSocieites(List<dynamic> t) async {
    await Main.localStorage.write(key: "societies", value: jsonEncode(t));
  }

  static Future<List<Userlist>?> fetchPeople() async {
    return jsonDecode(await Main.localStorage.read(key: "people") ?? "[]");
  }
  static Future<List<dynamic>> fetchSocieties() async {
    return jsonDecode(await Main.localStorage.read(key: "societies") ?? "[]");
  }

  static Future<dynamic> EmptySoc() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "societies") ?? "[]");
    return temp == "" || temp!.length == 0;
  }
  static Future<dynamic> EmptyPeople() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "people") ?? "[]");
    return temp == "" || temp!.length == 0;
  }
}
