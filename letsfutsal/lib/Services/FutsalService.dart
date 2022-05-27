import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:letsfutsal/Entities/Opponent.dart';

import '../Entities/Futsal.dart';
import '../global.dart';

class FutsalService{

  Future<List<Futsal>> getFutsals() async {
    Response res = await http.get(
      Uri.parse("$localhost/futsal/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Futsal.fromJson(e)).toList();
  }

}