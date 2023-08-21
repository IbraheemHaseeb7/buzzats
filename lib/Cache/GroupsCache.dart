import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class GroupsCache {


  static List<dynamic> groups = [];
 

  static void storeGc(List<dynamic> t) async {
    await Main.localStorage.write(key: "groups", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchGc() async {
    return jsonDecode(await Main.localStorage.read(key: "groups") ?? "[]");
  }
  
   static Future<dynamic> isEmptyGc() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "groups") ?? "[]");
    return temp == "" || temp!.length == 0;
  }


  static void delete() async{
    await Main.localStorage.write(key: "groups", value: jsonEncode([]));
  }


  
}
