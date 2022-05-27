
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../Entity/Booking.dart';
import '../global.dart';

class BookingService {
  Future<List<Booking>> getBookings(String type, DateTime date) async {
    Response res = await http.get(
      Uri.parse("$localhost/booking/$type/${date.toString().substring(0, 19)}"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Booking.fromJson(e)).toList();
  }
}
