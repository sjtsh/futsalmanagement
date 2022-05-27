//admin, name start_date end_date
// court_type organizer registration_cost
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Entity/Booking.dart';
import '../Entity/Tournament.dart';
import '../Entity/UserBooking.dart';
import '../global.dart';

class UserBookingService {

  Future<List<UserBooking>> getUserBookings() async {
    Response res = await http.get(Uri.parse("$localhost/userbooking/"));
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => UserBooking.fromJson(e)).toList();
  }
}
