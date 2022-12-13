import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Student Exams', elements: ["Algorithms", "Data Science", "Probability", "Statistic", "Database", "Computer science", "Mobile informations systems", ]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  final List<String> elements;

  const MyHomePage({required this.title, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => print("Add exam"),
            backgroundColor: Colors.white,
            foregroundColor: Theme.of(context).primaryColorDark,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (contxt, index)
        {
          print(elements[index]);
          return Card(
            elevation: 4,
            child: Column(children: [
              Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Text(
                elements[index], 
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(contxt).primaryColorDark),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    "Date: 25.12.2022",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  Text(
                    "Time: 08:00",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                ]
                ),
              ),
            ],) 
          );
        } ,
      )
    );
  }
}

