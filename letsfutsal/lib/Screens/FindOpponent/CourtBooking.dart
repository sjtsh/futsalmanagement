import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/Booking.dart';
import 'package:letsfutsal/Services/BookingService.dart';
import 'package:letsfutsal/Services/OpponentService.dart';

import 'CalendarDialogBox.dart';

class CourtBooking extends StatefulWidget {
  final String type;

  CourtBooking(this.type);

  @override
  State<CourtBooking> createState() => _CourtBookingState();
}

class _CourtBookingState extends State<CourtBooking> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Create Your Match"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                DateTime? newdate = await showDialog(
                    context: context,
                    builder: (_) {
                      return CalendarDialogBox(date);
                    });
                date = newdate ?? date;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date.toString().substring(0, 10),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.today,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: BookingService().getBookings(widget.type, date),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Booking> bookings = snapshot.data;
                      return bookings.length == 0?
                       Column(
                         children: [
                           Center(
                             child: Text(
                               "Available Bookings 'Court ${widget.type}'",
                               style: TextStyle(
                                   fontWeight: FontWeight.bold, fontSize: 25),
                             ),
                           ),
                           Expanded(
                             child: Center(
                              child: Text("No Rows"),
                      ),
                           ),
                         ],
                       ): ListView(
                        children: [
                          Center(
                            child: Text(
                              "Available Bookings 'Court A'",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          ...bookings
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    OpponentService()
                                        .postOpponentFinding(e.id)
                                        .then((value) {
                                      print(value);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text("Finding a match for you")));
                                      setState(() {});
                                    }).onError((error, stackTrace) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(error.toString())));
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    height: 50,
                                    color: Colors.blueGrey,
                                    child: Center(
                                      child: Text(
                                        "${e.start_time.hour > 12 ? "${e.start_time.hour - 12}PM" : "${e.start_time.hour}AM"} - ${e.end_time.hour > 12 ? "${e.end_time.hour - 12}PM" : "${e.end_time.hour}AM"} ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            "Available Bookings 'Court A'",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("No Rows"),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
