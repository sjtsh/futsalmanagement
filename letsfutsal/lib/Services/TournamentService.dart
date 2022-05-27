import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Entities/TournamentEntity.dart';
import '../global.dart';

class TournamentService {
  Future<List<TournamentEntity>> getTournaments() async {
    Response res = await http.get(
      Uri.parse("$localhost/tournament/"),
    );
    print(res.body);
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => TournamentEntity.fromJson(e)).toList();
  }

  Future<bool> registerTournaments( int tournament) async {
    Response res = await http.get(
      Uri.parse("$localhost/register/$id/$tournament/"),
    );
    if (res.statusCode == 200) {
      return true;
    }
    throw "Internet connection unavailable";
  }
}
