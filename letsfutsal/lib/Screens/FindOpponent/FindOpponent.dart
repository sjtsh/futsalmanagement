import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/Opponent.dart';
import 'package:letsfutsal/Services/OpponentService.dart';

import 'CreateMatch.dart';

class FindOpponent extends StatefulWidget {
  const FindOpponent({Key? key}) : super(key: key);

  @override
  State<FindOpponent> createState() => _FindOpponentState();
}

class _FindOpponentState extends State<FindOpponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Find Opponent"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: OpponentService().getOpponents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Opponent> opponents = snapshot.data;
                return ListView(children: [
                  ...opponents
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(12),
                          height: 120,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 0),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ]),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Icon(
                                        Icons.thumb_up,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${e.startTime.hour > 12 ? "${e.startTime.hour - 12}PM" : "${e.startTime.hour}AM"} - ${e.endTime.hour > 12 ? "${e.endTime.hour - 12}PM" : "${e.endTime.hour}AM"}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Created by ${e.name}",
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        )
                                      ],
                                    )
                                  ],
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
                                      OpponentService()
                                          .acceptOpponentFinding(e.id, e.booking)
                                          .then((value) {
                                        print(value);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Accepted")));
                                        setState(() {});
                                      }).onError((error, stackTrace) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text(error.toString())));
                                      });
                                    },
                                    child: Text(
                                      "Accept Challenge",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      OpponentService()
                                          .acceptOpponentFinding(e.id, e.booking)
                                          .then((value) {
                                        print(value);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                            content: Text("Declined")));
                                        setState(() {});
                                      }).onError((error, stackTrace) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content:
                                            Text(error.toString())));
                                      });
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return CreateMatch();
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 80,
                      color: Colors.blueGrey,
                      child: Center(
                        child: Text(
                          "Create New Match",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ]);
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
