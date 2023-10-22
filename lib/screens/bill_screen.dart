import 'dart:convert';
import 'package:finance_app/models/appointment_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  DateTime today = DateTime.now();
  List<Appointments> appointmentsList = [];
  final List<Color> availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
    Colors.amber,
    Colors.brown,
    Colors.grey,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.lightGreen,
  ];

  @override
  void initState() {
    super.initState();
    loadAppointmentsFromJson();
  }

  Future<void> loadAppointmentsFromJson() async {
    final String jsonAppointments =
        await rootBundle.loadString('assets/appointments.json');
    final List<dynamic> decodedJson = jsonDecode(jsonAppointments);

    final random = Random();

    for (final item in decodedJson) {
      Appointments appointment = Appointments(
        subject: item['subject'],
        startTime: DateTime.parse(item['startTime']),
        endTime: DateTime.parse(item['endTime']),
        color: availableColors[random.nextInt(availableColors.length)],
      );

      setState(() {
        appointmentsList.add(appointment);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      firstDayOfWeek: 6,
      dataSource: MeetingDataSource(appointmentsList),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointments> source) {
    appointments = source.map((appointment) {
      return Appointment(
        startTime: appointment.startTime,
        endTime: appointment.endTime,
        subject: appointment.subject,
        color: appointment.color,
      );
    }).toList();
  }
}
