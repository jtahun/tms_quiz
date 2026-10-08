import 'package:flutter/material.dart';

import 'package:tms_quiz/src/quiz/models/quiz_result.dart';

import 'package:tms_quiz/src/quiz/widgets/result_question_card.dart';

class ResultSummary extends StatelessWidget {
  final QuizResult result;

  const ResultSummary({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final questionResults = result.questionResults;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),

      itemCount: questionResults.length + 1,

      separatorBuilder: (_, __) => const SizedBox(height: 12),

      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),

            child: Text(
              'Your result: ${result.rightAnswersAmount} / ${result.quiz.questions.length}',

              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ResultQuestionCard(result: questionResults[index - 1]);
      },
    );
  }
}
