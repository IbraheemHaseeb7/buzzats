import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> query(String query) async {
  const url =
      'https://great-resonant-year.glitch.me/query'; // Replace with your API endpoint URL

  final headers = {'Content-Type': 'application/json'};
  final body = {'query': query};

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> resp = data["data"];
      return resp;
    } else {
      throw Exception('Failed to fetch data'); // Custom error message
    }
  } catch (e) {
    throw Exception('Error: $e'); // Catch and re-throw the error with additional context
  }
}