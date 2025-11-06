import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  String _timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    if (diff.isNegative) return "Испитот е поминат";
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final date = "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}";
    final time = "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exam.subject, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text("Датум: $date"),
                ]),
                Row(children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Text("Време: $time"),
                ]),
                Row(children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8),
                  Text("Простории: ${exam.rooms.join(', ')}"),
                ]),
                const SizedBox(height: 16),
                Text("До испитот има: ${_timeUntilExam()}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
