import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tms_quiz/src/quiz/models/quiz.dart';

class QuizzesNotifier extends ChangeNotifier {
  QuizzesNotifier(){
    loadQuizzes();
  }

  List<Quiz> quizzes = [];

  void loadQuizzes() async {
    final collection = await FirebaseFirestore.instance.collection('quizzes').get();
    notifyListeners();
    
  }
}

class QuizzesState extends InheritedNotifier<QuizzesNotifier> {
  QuizzesState({
    super.key,
    required super.child,
    required QuizzesNotifier notifier,
  }) : super(notifier: notifier);

  static QuizzesNotifier of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<QuizzesState>();

    if (result == null) {
      throw Exception('QuizzesState not found');
    }

    return result.notifier!;
  }
}