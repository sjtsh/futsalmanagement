import 'package:flutter/material.dart';

class CalendarDialogBox extends StatelessWidget {
  final DateTime initialDateTime;
  CalendarDialogBox(this.initialDateTime);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          color: Colors.white,
          width: 200,
          child: CalendarDatePicker(
            initialDate: initialDateTime,
            firstDate: DateTime(2021),
            lastDate: DateTime(2023),
            onDateChanged: (DateTime datetime) {
              Navigator.pop(context, datetime);
            },
          ),
        ),
      ),
    );
  }
}