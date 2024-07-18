import 'package:first_pj/data/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData
                .map((data) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.red, width: 2.0),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    ((data["question_index"] as int) + 1)
                                        .toString(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(data["question"] as String),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(data["user_answer"] as String),
                                    Text(data["correct_answer"] as String),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                .toList()),
      ),
    );
  }
}
