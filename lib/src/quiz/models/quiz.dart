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

  factory Quiz.fromJson(Map<String, dynamic> json){
    return Quiz(
      title:json['title'],
      id: json['id']?.toString() ?? '',
      questions: (json['questions'] as List<dynamic>? ??[]).map((e) => Question.formJson(Map<String,dynamic>.from(e as Map),
      ),
      ).toList()
    );
  }
}