import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class Auth {
  Future<String> signIn(String username, String password) async {
    Response res = await http.post(
      Uri.parse("$localhost/signinadmin/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"email": username, "password": password},
      ),
    );
    if (res.statusCode == 200) {
      if (jsonDecode(res.body).toString() == "false") {
        throw "Incorrect credentials";
      } else {
        return jsonDecode(res.body);
      }
    }
    throw "Internet connection unavailable";
  }
}
