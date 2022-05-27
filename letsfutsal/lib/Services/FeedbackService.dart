import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:letsfutsal/Entities/Opponent.dart';

import '../global.dart';

class FeedbackService {
  Future<bool> postFeedback(String subject, String description) async {
    Response res = await http.post(
      Uri.parse("$localhost/feedback/insert/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {
          "user": id,
          "subject": subject,
          "description": description,
        },
      ),
    );
    if (res.statusCode == 200) {
      return true;
    }
    throw "Internet connection unavailable";
  }
}
