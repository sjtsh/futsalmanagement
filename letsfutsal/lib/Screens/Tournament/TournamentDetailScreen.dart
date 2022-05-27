import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/TournamentEntity.dart';
import 'package:letsfutsal/Services/TournamentService.dart';

import 'TournamentRegistration.dart';

class TournamentDetailScreen extends StatelessWidget {
  final TournamentEntity tournamentEntity;

  TournamentDetailScreen(this.tournamentEntity);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Tournament Detail"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ...[
                ["Tournament Name: ", tournamentEntity.name],
                ["Organizer: ", tournamentEntity.organizer],
                ["Court Type: ", tournamentEntity.courtType],
                ["Registration Cost: ", "Rs. ${tournamentEntity.cost}"],
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Text(
                              e[0],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              e[1],
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              GestureDetector(
                onTap: () {
                TournamentService().registerTournaments(tournamentEntity.id)
                    .then((value) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                      content: Text("Tournament registered")));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                      content: Text(error.toString())));
                });
                },
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
