import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/Notice.dart';

class NotificationDetail extends StatelessWidget {
  final Notice notice;

  NotificationDetail(this.notice);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Notification Detail"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            ["Subject: ", notice.subject],
            ["Description: ", notice.description]
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Text(
                          e[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Expanded(
                          child: Text(
                            e[1],
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
