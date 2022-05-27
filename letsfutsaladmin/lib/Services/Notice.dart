import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class NoticeService {
  Future<bool> postNotice(String subject, String message) async {
    Response res = await http.post(
      Uri.parse("$localhost/notice/insert/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"subject": subject, "description": message, "admin": "1"},
      ),
    );
    if (res.statusCode == 200) {
      return true;
    }
    throw "Internet connection unavailable";
  }
}
