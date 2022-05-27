import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/TournamentEntity.dart';
import 'package:letsfutsal/global.dart';

class TournamentRegistration extends StatefulWidget {
final TournamentEntity tournamentEntity;
TournamentRegistration(this.tournamentEntity);
  @override
  State<TournamentRegistration> createState() => _TournamentRegistrationState();
}

class _TournamentRegistrationState extends State<TournamentRegistration> {
  String paymentmethod = "Choose Payment Method";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Tournament Registration"))),
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
                ["Name: ", username],
                ["Tournament Name: ", widget.tournamentEntity.name],
                ["Court Type: ", widget.tournamentEntity.courtType],
                ["Registration Cost: ", "Rs. ${widget.tournamentEntity.cost}"],
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
              // TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black.withOpacity(0.5),
              //       ),
              //     ),
              //     hintText: "No of Player"
              //   ),
              // ),
              // SizedBox(
              //   height: 12,
              // ),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.black.withOpacity(0.5))),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: DropdownButton(
              //             underline: Container(),
              //             value: paymentmethod,
              //             icon: Container(),
              //             items: ["Khalti", "Cash", "Choose Payment Method"]
              //                 .map((e) => DropdownMenuItem(
              //                       child: Row(
              //                         mainAxisSize: MainAxisSize.max,
              //                         children: [
              //                           Text(
              //                             e,
              //                             style: TextStyle(
              //                                 color: Colors.black
              //                                     .withOpacity(0.5)),
              //                           ),
              //                         ],
              //                       ),
              //                       value: e,
              //                     ))
              //                 .toList(),
              //             onChanged: (String? a) {
              //               if (a != null) {
              //                 paymentmethod = a;
              //               }
              //             },
              //           ),
              //         ),
              //         Icon(Icons.arrow_drop_down)
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "Make Payment",
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
