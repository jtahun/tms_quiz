import 'package:tms_quiz/src/quiz/models/answer.dart';
import 'package:tms_quiz/src/quiz/models/question.dart';
import 'package:tms_quiz/src/quiz/models/quiz.dart';

class QuizQuestionResult {
  final Question question;
  final Answer selectedAnswer;
  final Answer? correctAnswer;

  const QuizQuestionResult({
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  bool get isCorrect => selectedAnswer.isCorrect;
}

class QuizResult {
  final Quiz quiz;

  final Map<int, int> _selectedAnswers = {};

  QuizResult({required this.quiz});

  void addAnswer({
    required int questionIndex,
    required int answerIndex,
  }) {
    if (questionIndex < 0 || questionIndex >= quiz.questions.length) {
      throw RangeError.index(
        questionIndex,
        quiz.questions,
        'questionIndex',
      );
    }

    final answers = quiz.questions[questionIndex].answers;

    if (answerIndex < 0 || answerIndex >= answers.length) {
      throw RangeError.index(
        answerIndex,
        answers,
        'answerIndex',
      );
    }

    _selectedAnswers[questionIndex] = answerIndex;
  }

  int get answeredQuestionsAmount => _selectedAnswers.length;

  List<bool> get answers => [
        for (final entry in _selectedAnswers.entries)
          quiz.questions[entry.key]
              .answers[entry.value]
              .isCorrect,
      ];

  List<QuizQuestionResult> get questionResults => [
        for (var i = 0; i < quiz.questions.length; i++)
          if (_selectedAnswers.containsKey(i))
            QuizQuestionResult(
              question: quiz.questions[i],
              selectedAnswer:
                  quiz.questions[i].answers[_selectedAnswers[i]!],
              correctAnswer: _correctAnswerFor(quiz.questions[i]),
            ),
      ];

  Answer? _correctAnswerFor(Question question) {
    for (final answer in question.answers) {
      if (answer.isCorrect) {
        return answer;
      }
    }

    return null;
  }

  int get rightAnswersAmount =>
      answers.where((answer) => answer).length;

  double get successPercent => quiz.questions.isEmpty
      ? 0
      : rightAnswersAmount / quiz.questions.length * 100;

  Map<String, dynamic> toJson() {
    return {
      'quizId': quiz.id,
      'value': successPercent,
    };
  }
}

/*import 'package:tms_quiz/src/quiz/models/quiz.dart';

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
*/

