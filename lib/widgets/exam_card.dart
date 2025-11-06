import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}";
    final time = "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}";

    return Card(
      color: exam.passed ? Colors.green[100] : Colors.blue[100],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Icon(
          exam.passed ? Icons.check_circle : Icons.schedule,
          color: exam.passed ? Colors.green : Colors.blue,
        ),
        title: Text(exam.subject, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 4),
              Text(date),
            ]),
            Row(children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              Text(time),
            ]),
            Row(children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 4),
              Expanded(child: Text(exam.rooms.join(', '))),
            ]),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
