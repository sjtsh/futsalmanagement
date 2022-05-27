//admin, name start_date end_date
// court_type organizer registration_cost
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Entity/Tournament.dart';
import '../global.dart';

class TournamentService {
  Future<bool> postTournament(DateTime startDate, DateTime endDate, String name,
      String courtType, String organizer, int registrationCost) async {
    Response res = await http.post(
      Uri.parse("$localhost/tournament/insert/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {
          "name": name,
          "start_date": startDate.toString(),
          "end_date": endDate.toString(),
          "court_type": courtType,
          "organizer": organizer,
          "registration_cost": registrationCost,
          "admin": "1"
        },
      ),
    );
    if (res.statusCode == 200) {
      return true;
    }
    throw "Internet connection unavailable";
  }

  Future<List<Tournament>> getTournaments() async {
    Response res = await http.get(Uri.parse("$localhost/tournament/"));
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Tournament.fromJson(e)).toList();
  }
}
