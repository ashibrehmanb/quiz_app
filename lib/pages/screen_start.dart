import 'package:flutter/material.dart';
import 'package:quiz_app/pages/screen_quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Learn Flutter the Fun Way!',
            style: TextStyle(fontSize: 21),
          ),
          const SizedBox(
            height: 100,
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
            icon: const Icon(Icons.navigate_next_rounded),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
}
