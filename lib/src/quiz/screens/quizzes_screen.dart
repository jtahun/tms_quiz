
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/quiz/state/quizzes_state.dart';
import 'package:tms_quiz/src/quiz/widgets/quiz_preview.dart';

@RoutePage()
class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: OwnAppBar(
        text: 'Quizzes',
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: 
          QuizzesState.of(context).quizzes.map((quiz) => QuizPreview(
            title: quiz.title, 
            questions: quiz.questions.length, 
            onTap: (){}
            )
          ).toList(),

        
      )
    );
  }
}