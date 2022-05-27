import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:letsfutsal/Entities/Notice.dart';
import 'package:letsfutsal/Entities/Notice.dart';
import 'package:letsfutsal/Entities/Notice.dart';
import 'package:letsfutsal/Entities/Opponent.dart';

import '../Entities/Futsal.dart';
import '../global.dart';

class NoticeService{

  Future<List<Notice>> getNotices() async {
    Response res = await http.get(
      Uri.parse("$localhost/notice/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Notice.fromJson(e)).toList();
  }
}