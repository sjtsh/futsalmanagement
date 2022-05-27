import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:letsfutsal/Entities/Opponent.dart';

import '../global.dart';

class OpponentService {
  Future<List<Opponent>> getOpponents() async {
    Response res = await http.get(
      Uri.parse("$localhost/opponent/"),
    );
    print(res.body);
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Opponent.fromJson(e)).toList();
  }

  Future<bool> postOpponentFinding(int bookingID) async {
    Response res = await http.post(
      Uri.parse("$localhost/post/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"user": id, "booking": bookingID},
      ),
    );
    if (res.statusCode == 200) {
      return true;
    }
    throw "Internet connection unavailable";
  }

  Future<bool> acceptOpponentFinding(int opponentID, int booking) async {
    Response res = await http.post(
      Uri.parse("$localhost/accept/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"user": id, "id": opponentID, "booking": booking},
      ),
    );
    if (res.statusCode == 200) {
      return true;
    }
    throw "Internet connection unavailable";
  }
// Future<String> signIn(String username, String password) async {
//   Response res = await http.post(
//     Uri.parse("$localhost/signin/"),
//     headers: {"content-type": "application/json"},
//     body: jsonEncode(
//       {"email": username, "password": password},
//     ),
//   );
//   print(res.body);
//   if (res.statusCode == 200) {
//     if (jsonDecode(res.body).toString() == "false") {
//       throw "Incorrect credentials";
//     } else {
//       Map<String, dynamic> parsable = jsonDecode(res.body);
//       id = parsable["id"];
//       username = parsable["name"];
//       email = parsable["email"];
//       address = parsable["address"];
//       phone = parsable["phone"];
//       return username;
//     }
//   }
//   throw "Internet connection unavailable";
// }
}
