import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Entity/Booking.dart';
import 'package:letsfutsaladmin/Services/UserBookingService.dart';

import '../../Entity/UserBooking.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Booking Detail",
          style: TextStyle(fontSize: 20),
        ),
        Divider(
          color: Colors.black.withOpacity(0.1),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        "User1",
                        "User2",
                        "Court Type",
                        "Booking Date",
                        "Match Time",
                        "Price",
                        "Created",
                      ]
                          .map(
                            (e) =>
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                color: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.1)))),
                                  child: Text(e),
                                ),
                              ),
                            ),
                      )
                          .toList(),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                        future: UserBookingService().getUserBookings(),
                        builder: (BuildContext context,
                            AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List<UserBooking> userbookings = snapshot.data;
                            return Column(children: userbookings.map((e) => Row(
                              children: [
                                e.user1,
                                e.user2,
                                e.court_type,
                                e.date,
                                "${e.startTime.toString().substring(11,19)} - ${e.endTime.toString().substring(11,19)}",
                                e.price,
                                e.created,
                              ].map(
                                    (e) =>
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        color: Colors.white,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Colors.black
                                                          .withOpacity(0.1)))),
                                          child: Text(e.toString()),
                                        ),
                                      ),
                                    ),
                              )
                                  .toList(),
                            ),).toList(),);
                          }
                          return Center(
                            child: Text("No Rows"),
                          );
                        },
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
