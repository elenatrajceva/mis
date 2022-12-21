
import 'package:flutter/material.dart';

class ExamItem{
  final String id;
  final String subject_name;
  final DateTime date;
  final TimeOfDay time;

  ExamItem({
    required this.id, 
    required this.subject_name,
    required this.date, 
    required this.time
    });

}