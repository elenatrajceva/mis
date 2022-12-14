import 'package:flutter/material.dart';
import 'package:lab3_app/Model/exam_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Text("calendar screen"),
      );
  }

}

class MyCalendarPage extends StatefulWidget {
  final List<ExamItem> items;

  MyCalendarPage(this.items);

  @override
  _MyCalendarPageState createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPage> {

  List<Appointment> getExams() {
    List<Appointment> appointment = <Appointment>[];
    
    for (var item in widget.items) {
      final String name = item.subject_name;
      final DateTime date = item.date;
      final TimeOfDay time = item.time;
      final DateTime startTime = DateTime(date.year, date.month, date.day, time.hour , time.minute , 0);
      final DateTime endTime = startTime.add(const Duration(hours: 2));

      appointment.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: name,
      color: Colors.blue,
       ));
    }
  
    return appointment;   
}

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        dataSource: ExamsDataSource(getExams()),
      ),
      );
  }

}

class ExamsDataSource extends CalendarDataSource {
  ExamsDataSource(List<Appointment> source){
    appointments = source;
  }
}