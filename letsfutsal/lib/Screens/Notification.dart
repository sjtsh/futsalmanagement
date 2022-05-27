import 'package:flutter/material.dart';
import 'package:letsfutsal/Entities/Notice.dart';

import '../Services/NoticeService.dart';
import 'NotificationDetail.dart';

class MyNotifications extends StatelessWidget {
  const MyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Expanded(child: Center(child: Text("Notifications"))),
            Icon(
              Icons.arrow_back_sharp,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: NoticeService().getNotices(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
            List<Notice> notices = snapshot.data;
              return ListView(
                children: notices
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
                                      Icons.message,
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
                                       e.subject,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Create by Admin (${e.admin})",
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
                                      return NotificationDetail(e);
                                    }));
                                  },
                                  child: Text(
                                    "Read Detail",
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
            return Center(child: CircularProgressIndicator());
          }),
    ));
  }
}
