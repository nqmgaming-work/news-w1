import 'package:first_pj/data/questions.dart';
import 'package:first_pj/screen/question/view/answer_button.dart';
import 'package:first_pj/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String chooseAnswer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          // ListView.builder(
          //    shrinkWrap: true,
          //    itemCount: currentQuestion.answers.length,
          //    itemBuilder: (context, index) {
          //      return AnswerButton(
          //        answerText: currentQuestion.answers[index],
          //        onPressed: () {
          //         logger.i("Button pressed");
          //        },
          //      );
          //    },
          //  ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answerText: answer,
              onPressed: () {
                logger.i("Button pressed");
                answerQuestion(answer);
              },
            );
          }),
        ],
      ),
    );
  }
}
