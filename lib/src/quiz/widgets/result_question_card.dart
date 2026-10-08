import 'package:flutter/material.dart';

import 'package:tms_quiz/src/quiz/models/quiz_result.dart';

class ResultQuestionCard extends StatelessWidget {
  final QuizQuestionResult result;

  const ResultQuestionCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final isCorrect = result.isCorrect;

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            result.question.title,

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF242424),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Your answer: ${result.selectedAnswer.title}',

            style: TextStyle(
              fontSize: 13,

              color: isCorrect
                  ? const Color(0xFF24864A)
                  : const Color(0xFFC64D4D),
            ),
          ),

          if (!isCorrect && result.correctAnswer != null) ...[
            const SizedBox(height: 4),

            Text(
              'Right answer: ${result.correctAnswer!.title}',

              style: const TextStyle(fontSize: 13, color: Color(0xFF24864A)),
            ),
          ],
        ],
      ),
    );
  }
}
