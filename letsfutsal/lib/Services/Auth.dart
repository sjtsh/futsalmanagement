import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class Auth {
  Future<String> signIn(String username, String password) async {
    Response res = await http.post(
      Uri.parse("$localhost/signin/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"email": username, "password": password},
      ),
    );
    print(res.body);
    if (res.statusCode == 200) {
      if (jsonDecode(res.body).toString() == "false") {
        throw "Incorrect credentials";
      } else {
        Map<String, dynamic> parsable = jsonDecode(res.body);
        id = parsable["id"];
        username = parsable["name"];
        email = parsable["email"];
        address = parsable["address"];
        phone = parsable["phone"];
        return username;
      }
    }
    throw "Internet connection unavailable";
  }

  Future<String> signUp(
    String name,
    String password,
    String email,
    String number,
    String address,
  ) async {
    Response res = await http.post(
      Uri.parse("$localhost/signup/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {
          "name": name,
          "password": password,
          "email": email,
          "number": number,
          "address": address,
        },
      ),
    );
    print(res.body);
    if (res.statusCode == 200) {
      if (jsonDecode(res.body).toString() == "false") {
        throw "Email Already in use";
      } else {
        Map<String, dynamic> parsable = jsonDecode(res.body);
        id = parsable["id"];
        username = parsable["name"];
        email = parsable["email"];
        address = parsable["address"];
        phone = parsable["phone"];
        return username;
      }
    }
    throw "Internet connection unavailable";
  }
}
