import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:tms_quiz/src/user/state/user_state.dart';

import 'package:tms_quiz/src/core/constants/theme_constants.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';

import 'package:tms_quiz/src/quiz/models/question.dart';
import 'package:tms_quiz/src/quiz/models/quiz.dart';
import 'package:tms_quiz/src/quiz/models/quiz_result.dart';

import 'package:tms_quiz/src/quiz/widgets/progress_bar.dart';
import 'package:tms_quiz/src/quiz/widgets/question_view.dart';

@RoutePage()
class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final pageController = PageController();

  late final QuizResult quizResult;

  bool _isAdvancing = false;

  @override
  void initState() {
    super.initState();

    quizResult = QuizResult(quiz: widget.quiz);
  }

   void _logOut(BuildContext context) async {
    await UserState.of(context).notifier!.logOut();
    if (!context.mounted) return;
    AutoRouter.of(context).replace(const WelcomeRoute());
  }

  void onAnswer(Question question, int answerIndex) {
    if (_isAdvancing) return;

    _isAdvancing = true;

    final questionIndex = widget.quiz.questions.indexOf(question);

    quizResult.addAnswer(
      questionIndex: questionIndex,
      answerIndex: answerIndex,
    );

    // Если это последний вопрос
    if (questionIndex == widget.quiz.questions.length - 1) {
      AutoRouter.of(context).replace(QuizResultRoute(result: quizResult));

      return;
    }

    // Если вопросы ещё остались
    pageController
        .nextPage(
          duration: const Duration(milliseconds: 150),
          curve: Curves.linear,
        )
        .whenComplete(() {
          _isAdvancing = false;
        });

    setState(() {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.backgroundColor,

      appBar: OwnAppBar(
        text: widget.quiz.title,
           actions: [
            TextButton(
             onPressed: () => _logOut(context),
             child: const Text('Log out'),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              ProgressBar(
                itemsAmount: widget.quiz.questions.length,
                currentItem: quizResult.answers.length,
              ),

              Expanded(
                child: PageView(
                  controller: pageController,

                  physics: const NeverScrollableScrollPhysics(),

                  children: widget.quiz.questions.asMap().entries.map((entry) {
                    final question = entry.value;

                    final isLast =
                        entry.key == widget.quiz.questions.length - 1;

                    return QuestionView(
                      question: question,

                      buttonText: isLast ? 'Show results' : 'Next',

                      onAnswerSelected: (index) => onAnswer(question, index),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
