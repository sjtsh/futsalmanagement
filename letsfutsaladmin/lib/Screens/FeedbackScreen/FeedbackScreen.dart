import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Entity/Feedback.dart';
import 'package:letsfutsaladmin/Services/FeedbackService.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

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
            "User's Feedbacks on Futsal and Services",
            style: TextStyle(fontSize: 30),
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
                        ["Name", 1],
                        ["Description", 3],
                        ["Created Date", 1],
                        ["Created By", 1],
                      ]
                          .map(
                            (e) => Expanded(
                              flex: e[1] as int,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                color: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.1)))),
                                  child: Text(e[0].toString()),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: FeedbackService().getFeedbacks(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<FeedbackMy> feedbacks = snapshot.data;
                          return ListView(
                              children: feedbacks
                                  .map(
                                    (e) => Row(
                                      children: [
                                        [e.name, 1],
                                        [e.description, 3],
                                        [e.created, 1],
                                        [e.createdBy, 1],
                                      ]
                                          .map(
                                            (e) => Expanded(
                                              flex: e[1] as int,
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                color: Colors.white,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1)))),
                                                  child: Text(e[0].toString()),
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
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
