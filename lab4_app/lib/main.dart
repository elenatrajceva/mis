import 'package:flutter/material.dart';
import 'package:lab3_app/Model/exam_item.dart';

import 'Widgets/new_element.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Exams',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ExamItem> _examItems = [
    ExamItem(
        id: "1",
        subject_name: "Algorithams",
        date: "25.12.2022",
        time: "12:00"),
    ExamItem(
        id: "2", subject_name: "Statistic", date: "25.12.2022", time: "09:00"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Exams'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addExamFunction(context),
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
                  return Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            child: Text(
                              _examItems[index].subject_name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(contxt).primaryColorDark),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date: ${_examItems[index].date}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Text(
                                    "Time: ${_examItems[index].time}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ]),
                          ),
                          IconButton(icon: Icon(Icons.delete), onPressed: () => _deleteItem(_examItems[index].id),)
                        ],
                      ));
                },
              ));
  }
}
