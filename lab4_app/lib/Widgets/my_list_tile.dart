import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final id;
  final subject_name;
  final date;
  final time;
  final Function func;

  MyListTile(this.id, this.subject_name, this.date, this.time, this.func);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Text(
                subject_name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date: ${date}",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "Time: ${time}",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ]),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => func(id),
            )
          ],
        ));
  }
}
