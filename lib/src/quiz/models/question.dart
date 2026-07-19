import 'package:tms_quiz/src/quiz/models/answer.dart';

class Question {
  final String title;
  final List<Answer> answers;


const Question ({
  required this.title,
  required this.answers,
});
}