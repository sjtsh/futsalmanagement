import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Screens/TournamentScreen/TournamentScreen.dart';

import 'BookingScreen/BookingScreen.dart';
import 'FeedbackScreen/FeedbackScreen.dart';
import 'HomeScreen/HomeScreen.dart';
import 'NoticeManagement/NoticeManagement.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int index = 0;

  changeIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  Widget getScreen(int index) {
    if (index == 0) {
      return HomeScreen();
    } else if (index == 1) {
      return BookingScreen();
    } else if (index == 2) {
      return TournamentScreen(changeIndex);
    } else if (index == 3) {
      return NoticeManagement();
    } else if (index == 4) {
      return FeedbackScreen();
    }
    return Container(
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.white,
            width: 300,
            child: Column(
              children: [
                [Icons.home, "Home"],
                [Icons.book, "Bookings"],
                // [Icons.attach_money, "Payment"],
                [Icons.emoji_events_rounded, "Tournament"],
                [Icons.message_outlined, "Notice"],
                [Icons.message, "Feedback"],
                [Icons.keyboard_return, "Logout"]
              ]
                  .asMap()
                  .entries
                  .map((e) => GestureDetector(
                        onTap: () {
                          if (e.value[1] == "Logout") {
                            Navigator.pop(context);
                          } else {
                            changeIndex(e.key);
                          }
                        },
                        child: Container(
                          color: e.key == index
                              ? Colors.black.withOpacity(0.1)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(e.value[0] as IconData),
                              ),
                              Text(e.value[1].toString())
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(child: getScreen(index)),
        ],
      ),
    );
  }
}
