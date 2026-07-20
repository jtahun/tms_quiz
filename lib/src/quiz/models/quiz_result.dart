import 'package:tms_quiz/src/quiz/models/quiz.dart';

class QuizResult {
  final Quiz quiz;
  final List<bool> _answers = [];

  List<bool> get answers => _answers.toList(growable: false);

  QuizResult({
    required this.quiz,
  });

  void addAnswer({
    required int questionIndex,
    required int answerIndex,
  }) {
    _answers.add(quiz.questions[questionIndex].answers[answerIndex].isCorrect);
  }

  double get successPercent => rightAnswersAmount / quiz.questions.length * 100;
  int get rightAnswersAmount => answers.where((answer) => answer).length;

  Map<String, dynamic> toJson() {
    return {
      'quizId': quiz.id,
      'value': successPercent,
    };
  }
}