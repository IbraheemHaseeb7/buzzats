import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class UserTweets {
  static void storeUserTweets(List<dynamic> t) async {
    await Main.localStorage.write(key: "userTweets", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchUserTweets() async {
    return jsonDecode(await Main.localStorage.read(key: "userTweets") ?? "");
  }

  static Future<dynamic> isEmpty() async {
    var temp =
        jsonDecode(await Main.localStorage.read(key: "userTweets") ?? "");
    return temp == "" || temp!.length == 0;
  }
}
