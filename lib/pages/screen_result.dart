import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/screen_quiz.dart';
import 'package:quiz_app/widgets/widget_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});
  final List<String> selectedAnswers;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'selected_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData;
    final totalQuestions = questions.length;
    final correctAnswers = summary
        .where((element) =>
            element['correct_answer'] == element['selected_answer'])
        .length;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have answered $correctAnswers correctly out of $totalQuestions questions!',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SummaryWidget(
              summary: summaryData,
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.green),
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text(
                'Restart Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
