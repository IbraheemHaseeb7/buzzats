import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class MembersCache {


  static List<dynamic> members = [];
 

  static void storeM(List<dynamic> t) async {
    await Main.localStorage.write(key: "members", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchM() async {
    return jsonDecode(await Main.localStorage.read(key: "members") ?? "[]");
  }
  
   static Future<dynamic> isEmptyM() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "members") ?? "[]");
    return temp == "" || temp!.length == 0;
  }


  static void delete() async{
    await Main.localStorage.write(key: "members", value: jsonEncode([]));
  }


  
}
