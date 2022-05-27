import 'package:flutter/material.dart';
import 'package:letsfutsal/Screens/AuthScreens/Signin.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        height: 120,
        width: 300,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 0),
              blurRadius: 3,
              spreadRadius: 1)
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Text(
                "Are you sure?",
                style: TextStyle(fontSize: 16),
              ),
            )),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Signin();
                  }));
                },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
