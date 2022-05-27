import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/TournamentEntity.dart';

import '../../Services/TournamentService.dart';
import 'TournamentDetailScreen.dart';
import 'TournamentRegistration.dart';

class Tournament extends StatelessWidget {
  const Tournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Tournament"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: TournamentService().getTournaments(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<TournamentEntity> tournaments = snapshot.data;
              return ListView(
                children: tournaments
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
                                      Icons.emoji_events_rounded,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.name,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Organized by ${e.organizer}",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return TournamentDetailScreen(e);
                                    }));
                                  },
                                  child: Text(
                                    "View More",
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
                                    TournamentService()
                                        .registerTournaments(e.id)
                                        .then((value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Tournament registered")));
                                    }).onError((error, stackTrace) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(error.toString())));
                                    });
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (_) {
                                    //   return TournamentRegistration(e);
                                    // }));
                                  },
                                  child: Text(
                                    "Register",
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
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
