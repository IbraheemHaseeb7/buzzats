import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> query(String query) async {
  const url =
      'https://great-resonant-year.glitch.me/query'; // Replace with your API endpoint URL

  final headers = {'Content-Type': 'application/json'};
  final body = {'query': query};

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List<dynamic> resp = data["data"];

    return resp;
  }
  throw Error();
}
