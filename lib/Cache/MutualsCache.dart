import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class MutualsCache {


  static List<dynamic> mutuals = [];
 

  static void storeMutuals(List<dynamic> t) async {
    await Main.localStorage.write(key: "mutuals", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchMutuals() async {
    return jsonDecode(await Main.localStorage.read(key: "mutuals") ?? "[]");
  }
  
   static Future<dynamic> isEmptyMutuals() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "mutuals") ?? "[]");
    return temp == "" || temp!.length == 0;
  }


  static void delete() async{
    await Main.localStorage.write(key: "mutuals", value: jsonEncode([]));
  }


  
}
