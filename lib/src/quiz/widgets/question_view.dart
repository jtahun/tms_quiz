import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';
import 'package:tms_quiz/src/core/widgets/button.dart';
import 'package:tms_quiz/src/quiz/models/answer.dart';
import 'package:tms_quiz/src/quiz/models/question.dart';

class QuestionView extends StatefulWidget {
final Question question;
final Function(int index)? onAnswerSelected;

  const QuestionView({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    });

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  Answer? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.question.title),        
        const SizedBox(height: 30),
        ...widget.question.answers.map(
          (answer) => GestureDetector(
            onTap: () => setState(() => _selectedAnswer = answer),
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: answer == _selectedAnswer ? ThemeConstants.primaryColor : Colors.white,
                border: Border.all(
                  color: ThemeConstants.primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(answer.title, style: TextStyle(
                  color: answer == _selectedAnswer ? Colors.white : null,
                ),
                ),
              ),
          ),
          ),
          Spacer(),
          Button(
            text: 'Next',
            onPressed: _selectedAnswer == null ? null : (){
              widget.onAnswerSelected?.call(widget.question.answers.indexOf(_selectedAnswer!));
            }
          ),                  
      ],
    );
  }
}