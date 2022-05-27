import 'package:flutter/material.dart';
import 'package:letsfutsal/Screens/AuthScreens/Signin.dart';
import 'package:letsfutsal/Screens/Help.dart';
import 'package:letsfutsal/Screens/LogoutDialog.dart';
import 'package:letsfutsal/Screens/Tournament/Tournament.dart';

import '../global.dart';
import 'FindOpponent/FindOpponent.dart';
import 'LocateFutsal.dart';
import 'MyProfile.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff525252),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  username,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MyProfile();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_pin_outlined,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "My Profile",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FindOpponent();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Find Opponent",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Tournament();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Tournament",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return LocateFutsal();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Locate Futsal",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Help();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Help and Support",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                Expanded(child: Container()),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return LogoutDialog();
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
