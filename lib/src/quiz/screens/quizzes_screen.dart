
//import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/quiz/models/quiz.dart';
import 'package:tms_quiz/src/quiz/state/quizzes_state.dart';
import 'package:tms_quiz/src/quiz/widgets/quiz_preview.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';

@RoutePage()
class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  void _navigageToQuiz(BuildContext context, Quiz quiz) {
    AutoRouter.of(context).push(QuizRoute(quiz: quiz));
  }

  void _logOut(BuildContext context) async{
    await UserState.of(context).notifier!.logOut();
    if(!context.mounted) return;
    AutoRouter.of(context).replace(const WelcomeRoute());
  }

  @override
  Widget build(BuildContext context) {

  final quizzes = QuizzesState.of(context).quizzes;

  debugPrint('QuizzesScreen BUILD: ${quizzes.length}');

    return  Scaffold(
      backgroundColor: ThemeConstants.backgroundColor,
      appBar: OwnAppBar(
        text: 'Quizzes',
        actions: [
          TextButton(
            onPressed: () => _logOut(context),
            child: const Text('Log out'),      
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: 
          QuizzesState.of(context).quizzes.map((quiz) => Padding(
            padding: const EdgeInsets.only(bottom : 10),
            child: QuizPreview(
              title: quiz.title, 
              questions: quiz.questions.length, 
              onTap: () => _navigageToQuiz(context, quiz),
              ),
            )
          ).toList(),

        
      )
    );
  }
}