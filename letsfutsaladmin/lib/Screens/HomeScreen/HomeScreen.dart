import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Screens/HomeScreen/CalendarDialogBox.dart';
import 'package:letsfutsaladmin/Services/BookingService.dart';
import 'package:letsfutsaladmin/global.dart';

import '../../Entity/Booking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownItem = "5A";
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xff1A5E20),
          height: 50,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Color(0xff1A5E20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                username.toString(),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.5)))),
                child: GestureDetector(
                  onTap: () async {
                    DateTime? datenew = await showDialog(
                        context: context,
                        builder: (_) {
                          return CalendarDialogBox(date);
                        });
                    setState(() {
                      date = datenew ?? date;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
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
                      SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Court Type",
                    style: TextStyle(
                        fontSize: 10, color: Colors.black.withOpacity(0.7)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black.withOpacity(0.5)))),
                    child: DropdownButton(
                      items: ["7A", "5A"]
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(
                                e.toString(),
                              ),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? a) {
                        setState(() {
                          dropdownItem = a ?? dropdownItem;
                        });
                      },
                      underline: Container(),
                      value: dropdownItem,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4),
              ],
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "$dropdownItem Court Available Bookings",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
                SizedBox(
                  height: 12,
                ),
                FutureBuilder(
                    future: BookingService().getBookings(dropdownItem, date),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Booking> bookings = snapshot.data;
                        return Wrap(
                          children: bookings
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.blueGrey,
                                    width: 300,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "${e.start_time.hour > 12 ? "${e.start_time.hour - 12}PM" : "${e.start_time.hour}AM"} - ${e.end_time.hour > 12 ? "${e.end_time.hour - 12}PM" : "${e.end_time.hour}AM"} ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      }
                      return Center(child: Text("No Rows"),);
                    })
              ],
            ),
          ),
        ))
      ],
    );
  }
}
