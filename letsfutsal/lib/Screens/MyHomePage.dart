import 'package:flutter/material.dart';
import 'package:letsfutsal/Screens/DrawerScreen.dart';
import 'package:letsfutsal/Screens/FindOpponent/CourtBooking.dart';

import 'Notification.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Expanded(child: Center(child: Text("Home"))),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MyNotifications();
                }));
              },
              child: Icon(
                Icons.notifications,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          "5A Court",
          "7A Court",
        ]
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CourtBooking(e.substring(0, 2));
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 150,
                    color: Colors.blueGrey,
                    child: Center(
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
