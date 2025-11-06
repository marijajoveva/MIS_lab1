import 'package:flutter/material.dart';
import 'screens/exam_list_screen.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 223018',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExamListScreen(),
    );
  }
}
