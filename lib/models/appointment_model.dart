import 'package:flutter/material.dart';

class Appointments {
  String subject;
  DateTime startTime;
  DateTime endTime;
  Color color;

  Appointments({
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.color,
  });
}
