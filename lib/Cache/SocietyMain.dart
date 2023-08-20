import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class SocietyMain {

  
  static List<dynamic> soctweets = [];

  static void storeTwts(List<dynamic> t) async {
    await Main.localStorage.write(key: "soctweets", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchTwts() async {
    return jsonDecode(await Main.localStorage.read(key: "soctweets") ?? "[]");
  }
  
   static Future<dynamic> isEmptyTwts() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "soctweets") ?? "[]");
    return temp == "" || temp!.length == 0;
  }


  static void delete() async{
    await Main.localStorage.write(key: "soctweets", value: jsonEncode([]));
  }




  // static void storeMembers(List<dynamic> t) async {
  //   await Main.localStorage.write(key: "members", value: jsonEncode(t));
  // }

  // static Future<List<dynamic>> fetchMembers() async {
  //   return jsonDecode(await Main.localStorage.read(key: "members") ?? "[]");
  // }

  //  static Future<dynamic> isEmptyMembers() async {
  //   var temp = jsonDecode(await Main.localStorage.read(key: "members") ?? "[]");
  //   return temp == "" || temp!.length == 0;
  // }



  // static void storeMutuals(List<dynamic> t) async {
  //   await Main.localStorage.write(key: "mutuals", value: jsonEncode(t));
  // }

  // static Future<List<dynamic>> fetchMutuals() async {
  //   return jsonDecode(await Main.localStorage.read(key: "mutuals") ?? "[]");
  // }

  //  static Future<dynamic> isEmptyMutuals() async {
  //   var temp = jsonDecode(await Main.localStorage.read(key: "mutuals") ?? "[]");
  //   return temp == "" || temp!.length == 0;
  // }

}
