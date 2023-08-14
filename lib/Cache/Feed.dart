import 'dart:convert';

import 'package:flutter_app_1/main.dart';

class Feed {
  static List<dynamic> tweets = [];

  static void storeTweets(List<dynamic> t) async {
    await Main.localStorage.write(key: "tweets", value: jsonEncode(t));
  }

  static Future<List<dynamic>> fetchTweets() async {
    return jsonDecode(await Main.localStorage.read(key: "tweets") ?? "");
  }

  static Future<dynamic> isEmpty() async {
    var temp = jsonDecode(await Main.localStorage.read(key: "tweets") ?? "");
    return temp == "" || temp!.length == 0;
  }
}
