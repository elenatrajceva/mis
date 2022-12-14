
import 'package:flutter/material.dart';
import 'package:lab3_app/Model/exam_item.dart';

class NewElement extends StatefulWidget {

  final Function addItem;

  NewElement(this.addItem);

  @override
  State<StatefulWidget> createState() => _NewElementState();
}

class _NewElementState extends State<NewElement> {

  final _subjectnameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  late String subject_name;
  late String date;
  late String time;

  void _submitData(){
    if(_subjectnameController.text.isEmpty) {
      return;
    }
    final enteredName = _subjectnameController.text;
    final enteredDate = _dateController.text;
    final enteredTime = _timeController.text;

    if (enteredDate == null || enteredTime == null){
      return;
    }

    final newItem = ExamItem(id: "", subject_name: enteredName, date: enteredDate, time: enteredTime);
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(bottom : 50.0),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _subjectnameController,
              decoration: InputDecoration(
                labelText: "Subject Name",
              ),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: "Date",
              ),
              //keyboardType: TextInputType.datetime,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: "Time",
              ),
              onSubmitted: (_) => _submitData(),
            ),
            TextButton(
              child: Text("Add exam"),
              onPressed: _submitData,
            ),
          ]),
      );
  }
}