import 'package:flutter/material.dart';

import 'CourtBooking.dart';

class CreateMatch extends StatelessWidget {
  const CreateMatch({Key? key}) : super(key: key);

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
        body: ListView(
          children: [
            "5A Court",
            "7A Court",
          ]
              .map((e) => GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return CourtBooking(e.substring(0,2));
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
      ),
    );
  }
}
