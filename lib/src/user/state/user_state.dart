import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  }

  Future<void> logOut() async {}
}

class UserState extends InheritedNotifier<UserNotifier> {
  UserState({
    super.key,
    required super.child,
  }) : super(
          notifier: UserNotifier(),
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