import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/quiz/models/question.dart';
import 'package:tms_quiz/src/quiz/models/quiz.dart';
import 'package:tms_quiz/src/quiz/models/quiz_result.dart';
import 'package:tms_quiz/src/quiz/widgets/progress_bar.dart';
import 'package:tms_quiz/src/quiz/widgets/question_view.dart';

@RoutePage()
class QuizScreen extends StatefulWidget {
  final Quiz quiz;
  

  const QuizScreen({super.key,
    required this.quiz,
  });
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final pageController = PageController();
  late final QuizResult quizResult;

  @override
  void initState(){
    super.initState();
    quizResult = QuizResult(quiz:   widget.quiz);
  }

  void onAnswer(Question question, int answerIndex){

    final questionIndex = widget.quiz.questions.indexOf(question);
    quizResult.addAnswer(questionIndex: questionIndex, answerIndex: answerIndex);

    //print(quizResult.answers);

    if(widget.quiz.questions.length - 1 == pageController.page){
      return;
    }    

    pageController.nextPage(
      duration: const Duration(microseconds: 150), 
      curve: Curves.linear,
      );

      setState(() {}); // Empty setState for redrawing 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: ThemeConstants.backgroundColor,
      appBar: OwnAppBar(
        text: widget.quiz.title,
      ) ,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //QuestionView(question: quiz.questions.first),
              ProgressBar(
                itemsAmount: widget.quiz.questions.length, 
                //currentItem: (pageController.page?.floor() ?? 0) + 1,
                currentItem: quizResult.answers.length,
                ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.quiz.questions.map((question) => QuestionView(
                    question: question,
                    onAnswerSelected: (index) => onAnswer(question, index),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}