import 'package:tms_quiz/src/quiz/models/answer.dart';

class Question {
  final String title;
  final List<Answer> answers;


const Question ({
  required this.title,
  required this.answers,
});

factory Question.formJson(Map<String, dynamic> json){
  return Question(title: json['title'], 
  answers: (json['answers'] as List).map((e) => Answer.fromJson(e)).toList(),
  );
 }
}