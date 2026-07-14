import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:tms_quiz/src/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: 'ju@eng.app',
    password: '848400',
  );
  print(result.user?.uid);

  runApp(const App());
}