import 'package:flutter/material.dart';
import '../Screens/calendar_screen.dart';
import '../Widgets/my_list_tile.dart';
import '../Model/exam_item.dart';
import '../Widgets/my_profile.dart';
import '../Widgets/new_element.dart';

import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ExamItem> _examItems = [
    // ExamItem(
    //     id: "1",
    //     subject_name: "Algorithams",
    //     date: DateTime(2022,12,25),
    //     time: TimeOfDay(hour: 23, minute: 30)),
    // ExamItem(
    //     id: "2",
    //     subject_name: "Statistic",
    //     date: DateTime.now(),
    //     time: TimeOfDay(hour: 9, minute: 30)),
  ];

  void _addExamFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewElement(_addNewItemToList),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewItemToList(ExamItem item) {
    setState(() {
      _examItems.add(item);
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _examItems.removeWhere((elem) => elem.id == id);
    });
  }

  void _showCalendar(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MyCalendarPage(_examItems)));
  }

  void _myProfile(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MyProfile()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Exams'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () => _showCalendar(context),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addExamFunction(context),
            ),
            IconButton(
              icon: Icon(Icons.supervised_user_circle),
              onPressed: () => _myProfile(context),
            ),
          ],
        ),
        body: _examItems.isEmpty
            ? Center(
                child: Text("No exams",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark)),
              )
            : ListView.builder(
                itemCount: _examItems.length,
                itemBuilder: (contxt, index) {
                  //print(_examItems[index]);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(_examItems[index].date);
                  DateTime parsedTime = DateFormat.Hm().parse(_examItems[index].time.format(context).toString());
                  String formattedTime = DateFormat('HH:mm:ss').format(parsedTime); 
                  return MyListTile(
                      _examItems[index].id,
                      _examItems[index].subject_name,
                      formattedDate,
                      formattedTime,
                      _deleteItem);
                },
              ));
  }
}
