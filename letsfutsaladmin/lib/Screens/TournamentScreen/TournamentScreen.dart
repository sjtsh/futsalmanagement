import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Entity/Tournament.dart';
import 'package:letsfutsaladmin/Services/TournamentService.dart';

import '../HomeScreen/CalendarDialogBox.dart';

class TournamentScreen extends StatefulWidget {
  final Function changeIndex;

  TournamentScreen(this.changeIndex);

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  bool isCreating = false;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String? dropdownItem;
  TextEditingController nameController = TextEditingController();
  TextEditingController organizerController = TextEditingController();
  TextEditingController numberofplayerController = TextEditingController();
  TextEditingController costController = TextEditingController();
  bool isValidation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "Tournament Detail",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Divider(
          color: Colors.black.withOpacity(0.1),
        ),
        if (!isCreating)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCreating = true;
                });
              },
              child: Container(
                color: Color(0xff3F51B5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        "Add Tournament",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCreating = false;
                    });
                  },
                  child: Container(
                    color: Color(0xff3F51B5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          Text(
                            "CLOSE",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              errorText:
                                  isValidation && nameController.text == ""
                                      ? "Name cant be empty"
                                      : null,
                              hintText: "Tournament Name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? dateTime = await showDialog(
                              context: context,
                              builder: (_) {
                                return CalendarDialogBox(startDate);
                              });
                          setState(() {
                            startDate = dateTime ?? startDate;
                          });
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      startDate.toString().substring(0, 10),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.today,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? dateTime = await showDialog(
                              context: context,
                              builder: (_) {
                                return CalendarDialogBox(endDate);
                              });
                          setState(() {
                            endDate = dateTime ?? endDate;
                          });
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black.withOpacity(0.5)))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      endDate.toString().substring(0, 10),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.today,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownButton(
                        hint: Text(
                          "Court Type",
                          style: TextStyle(
                              color: isValidation && dropdownItem == null
                                  ? Colors.red
                                  : null),
                        ),
                        items: ["7A", "5A"]
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(
                                  e.toString(),
                                ),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (String? a) {
                          setState(() {
                            dropdownItem = a ?? dropdownItem;
                          });
                        },
                        value: dropdownItem,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                            controller: organizerController,
                            decoration: InputDecoration(
                              hintText: "Organizer",
                              errorText:
                                  isValidation && organizerController.text == ""
                                      ? "Organizer cant be empty"
                                      : null,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                            controller: costController,
                            decoration: InputDecoration(
                              hintText: "Registration cost",
                              errorText: isValidation &&
                                      costController.text == ""
                                  ? "Cost cant be empty"
                                  : isValidation &&
                                          int.tryParse(costController.text) ==
                                              null
                                      ? "Cost must be integer"
                                      : null,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isValidation = true;
                      });
                      if (nameController.text != "" &&
                          organizerController.text != "") {
                        if (dropdownItem != null &&
                            int.tryParse(costController.text) != null) {
                          TournamentService()
                              .postTournament(
                                  startDate,
                                  endDate,
                                  nameController.text,
                                  dropdownItem!,
                                  organizerController.text,
                                  int.parse(costController.text))
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Post was successful"),
                              ),
                            );
                            nameController.text = "";
                            organizerController.text = "";
                            costController.text = "";
                            dropdownItem = null;
                            isValidation = false;
                            isCreating = false;
                            setState(() {});
                          }).onError((error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(error.toString())));
                          });
                        }
                      }
                    },
                    child: Container(
                      width: 300,
                      color: Color(0xff1A5E20),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        Divider(
          color: Colors.black.withOpacity(0.1),
        ),
        Center(
          child: Text(
            "Tournament Detail",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          color: Colors.black.withOpacity(0.1),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        "Tournament",
                        "Start Date",
                        "End Date",
                        "Court Type",
                        "Organizer",
                        "Registration",
                      ]
                          .map(
                            (e) => Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                color: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.1)))),
                                  child: Text(e),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                          future: TournamentService().getTournaments(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<Tournament> tournaments = snapshot.data;
                              return ListView(
                                  children: tournaments
                                      .map(
                                        (e) =>Row(
                                          children: [
                                            e.name,
                                            e.startDate.toString().substring(0,10),
                                            e.startDate.toString().substring(0,10),
                                            e.courtType,
                                            e.organizer,
                                           e.registrationCost,
                                          ]
                                              .map(
                                                (e) => Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                color: Colors.white,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color: Colors.black
                                                                  .withOpacity(0.1)))),
                                                  child: Text(e.toString()),
                                                ),
                                              ),
                                            ),
                                          )
                                              .toList(),
                                        ),
                                      )
                                      .toList());
                            }
                            return Center(
                              child: Text("No Rows"),
                            );
                          })),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
