import 'package:flutter/material.dart';

import '../Services/FeedbackService.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool isValidated = false;

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Help and Support"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextField(
                controller: subjectController,
                decoration: InputDecoration(
                  errorText: subjectController.text == "" && isValidated
                      ? "Subject cannot be empty"
                      : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  hintText: "Subject",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: descriptionController,
                maxLines: 10,
                decoration: InputDecoration(
                  errorText: descriptionController.text == "" && isValidated
                      ? "Message cannot be empty"
                      : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  hintText: "Write your message",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isValidated = true;
                  });
                  if (descriptionController.text != "" &&
                      subjectController.text != "") {
                    FeedbackService()
                        .postFeedback(
                            subjectController.text, descriptionController.text)
                        .then((value) {
                      descriptionController.text = "";
                      subjectController.text = "";
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Successfully posted".toString())));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                    });
                  }
                },
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "Send",
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
