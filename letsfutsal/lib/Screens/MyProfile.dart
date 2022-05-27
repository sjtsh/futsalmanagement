import 'package:flutter/material.dart';
import 'package:letsfutsal/global.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("My Profile"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12,),
            Container(
              height: 80,
              width: 80,
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
              height: 12,
            ),
            Text(username),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 1)
                ]),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12),
                      child: Icon(Icons.phone, color: Colors.pink,),
                    ),
                    SizedBox(width: 12,),
                    Text(phone)
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 1)
        ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 12),
              child: Icon(Icons.mail, color: Colors.pink,),
            ),
            SizedBox(width: 12,),
            Text(email)
          ],
        ),
      ),
    ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 1)
                ]),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12),
                      child: Icon(Icons.home, color: Colors.pink,),
                    ),
                    SizedBox(width: 12,),
                    Text(address)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
