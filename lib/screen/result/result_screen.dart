import 'package:first_pj/screen/result/view/question_summary.dart';
import 'package:flutter/material.dart';

import '../../data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "answer": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data["correct_answer"] == data["user_answer"])
        .length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        QuestionSummary(summaryData),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text("Restart Quiz!"),
          icon: const Icon(Icons.refresh),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white
          ),
        )
      ],
    );
  }
}
