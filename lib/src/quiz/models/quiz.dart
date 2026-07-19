import 'package:tms_quiz/src/quiz/models/question.dart';

class Quiz{
  final String id;
  final String title;
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });
}