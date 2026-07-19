import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';
import 'package:tms_quiz/src/quiz/models/question.dart';

class QuestionView extends StatelessWidget {
final Question question;

  const QuestionView({
    super.key,
    required this.question,
    });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(question.title),
        const SizedBox(height: 30),
        ...question.answers.map(
          (answer) => Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: ThemeConstants.primaryColor,
              ),
            )

          )
        )
      ],
    );
  }
}