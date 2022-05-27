import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Services/Notice.dart';


class NoticeManagement extends StatefulWidget {
  const NoticeManagement({Key? key}) : super(key: key);

  @override
  State<NoticeManagement> createState() => _NoticeManagementState();
}

class _NoticeManagementState extends State<NoticeManagement> {

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
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
            "Notice Management",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Divider(
          color: Colors.black.withOpacity(0.1),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 400,
            child: TextField(
                controller: subjectController,
                decoration: InputDecoration(
                  errorText: subjectController.text == "" && isValidation
                      ? "Subject cant be empty"
                      : null,
                  hintText: "Subject",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 20, left: 20),
            child: SizedBox(
              width: 400,
              child: TextField(
                  controller: messageController,
                  maxLines: 1000,
                  decoration: InputDecoration(
                    errorText: messageController.text == "" && isValidation
                        ? "Message cant be empty"
                        : null,

                    hintText: "Write Message Here",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 400,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  isValidation = true;
                  setState(() {

                  });
                  if (subjectController.text != "" &&
                      messageController.text != "") {
                    NoticeService().postNotice(
                        subjectController.text, messageController.text).then((
                        value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Successfully posted")));
                      subjectController.text = "";
                      messageController.text = "";
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                    });
                  }
                },
                child: Container(
                  height: 60,
                  width: 200,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
