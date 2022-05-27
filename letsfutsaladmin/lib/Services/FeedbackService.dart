import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Entity/Feedback.dart';
import '../Entity/Tournament.dart';
import '../global.dart';


class FeedbackService{

  Future<List<FeedbackMy>> getFeedbacks() async {
    Response res = await http.get(Uri.parse("$localhost/feedback/"));
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => FeedbackMy.fromJson(e)).toList();
  }

}