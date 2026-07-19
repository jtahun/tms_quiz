import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/quiz/models/quiz.dart';
import 'package:tms_quiz/src/quiz/widgets/question_view.dart';

@RoutePage()
class QuizScreen extends StatelessWidget {
  final Quiz quiz;

  const QuizScreen({super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: ThemeConstants.backgroundColor,
      appBar: OwnAppBar(
        text: quiz.title,
      ) ,
      body: ListView(
        children: [
          QuestionView(question: quiz.questions.first),
        ],
      ),
      
    );
  }
}