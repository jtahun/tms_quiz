class Answer{
  final String title;
  final bool isCorrect;


const Answer({
  required this.title,
  required this.isCorrect,
});

factory Answer.fromJson(Map<String, dynamic> json) {
  return Answer(
    title: json['title'],
    isCorrect: json['isCorrect'],
  );
}
}