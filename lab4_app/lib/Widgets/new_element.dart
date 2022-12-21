
import 'package:flutter/material.dart';
import '/Model/exam_item.dart';
import 'package:intl/intl.dart';

class NewElement extends StatefulWidget {

  final Function addItem;

  NewElement(this.addItem);

  @override
  State<StatefulWidget> createState() => _NewElementState();
}

class _NewElementState extends State<NewElement> {

  final _subjectnameController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  
  DateTime ? dateTime;
  TimeOfDay ? timeOfDay;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  late String subject_name;
  late String date;
  late String time;

  void _submitData(){
    if(_subjectnameController.text.isEmpty) {
      return;
    }
    final enteredName = _subjectnameController.text;
    final enteredDate = dateTime;
    final enteredTime = timeOfDay;

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
              controller: dateinput,
              decoration: InputDecoration(
                labelText: "Date",
              ),
               readOnly: true,
              //keyboardType: TextInputType.datetime,
              onTap: () async {
                DateTime ?pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text = formattedDate; //set output date to TextField value.
                        dateTime = pickedDate;
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
              
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: timeinput,
              decoration: InputDecoration(
                labelText: "Time",
              ),
              readOnly: true,
              onTap: () async {
                  TimeOfDay ?pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                      );
                  
                  if(pickedTime != null ){
                      print(pickedTime.format(context));   //output 10:51 PM
                      DateTime parsedTime = DateFormat.Hm().parse(pickedTime.format(context).toString());
                      //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        timeinput.text = formattedTime; //set the value of text field. 
                        timeOfDay = pickedTime;
                      });
                  }else{
                      print("Time is not selected");
                  }
                },
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