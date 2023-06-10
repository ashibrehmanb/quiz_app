import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/screen_result.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<String> selectAnswers = [];
  int currentQuizQuestionIndex = 0;
  void answerClicked() {
    setState(() {
      ++currentQuizQuestionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuizQuestion = questions[currentQuizQuestionIndex];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuizQuestion.question,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                ...currentQuizQuestion.shuffledList.map(
                      (e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              foregroundColor: Colors.green),
                          onPressed: () {
                            selectAnswers.add(e);
                            if (selectAnswers.length != questions.length) {
                              answerClicked();
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                            selectedAnswers: selectAnswers,
                                          )));
                            }
                          },
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
