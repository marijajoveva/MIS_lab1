import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({Key? key}) : super(key: key);

  List<Exam> get exams => [
    Exam(subject: "Бази на податоци", dateTime: DateTime(2026, 1, 15, 9, 0), rooms: ["Lab 12", "Lab 13"]),
    Exam(subject: "Веб програмирање", dateTime: DateTime(2025, 1, 20, 10, 0), rooms: ["Lab 3"], passed: true),
    Exam(subject: "Оперативни системи", dateTime: DateTime(2026, 1, 25, 8, 30), rooms: ["Lab 138"]),
    Exam(subject: "Компјутерски мрежи и безбедност", dateTime: DateTime(2025, 1, 28, 11, 0), rooms: ["Lab 200AB"], passed: true),
    Exam(subject: "Алгоритми и податочни структури", dateTime: DateTime(2025, 2, 1, 9, 0), rooms: ["Lab 2"], passed: true),
    Exam(subject: "Вештачка интелигенција", dateTime: DateTime(2026, 2, 5, 10, 30), rooms: ["Lab 215"]),
    Exam(subject: "Тимски проект", dateTime: DateTime(2025, 2, 10, 13, 0), rooms: ["Lab 117"]),
    Exam(subject: " Дизајн на интеракција човек-компјутер", dateTime: DateTime(2026, 2, 12, 9, 0), rooms: ["Lab 215"]),
    Exam(subject: "Програмирање на видео игри", dateTime: DateTime(2026, 2, 15, 14, 0), rooms: ["Lab 2"]),
    Exam(subject: "Управување со техничка поддршка", dateTime: DateTime(2026, 2, 18, 8, 0), rooms: ["Lab 13"]),
  ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Распоред за испити - 223018")),
      body: ListView(
        children: exams.map((e) => ExamCard(exam: e)).toList(),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.blue,
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
