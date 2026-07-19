import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:tms_quiz/src/user/state/add_quizes.dart'; /// ----------------------------

class UserNotifier extends ChangeNotifier {
  Future<void> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
   
    //await addQuizzes(); 
    print(FirebaseAuth.instance.currentUser?.uid); 
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;
}

class UserState extends InheritedNotifier<UserNotifier> {
  const UserState({
    super.key,
    required super.child,
    required UserNotifier notifier,
  }) : super(
          notifier: notifier,
        );

  static UserState of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<UserState>();

    if (result == null) {
      throw Exception('UserState not found');
    }

    return result;
  }
}