import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/routing/app_router.dart';
import 'package:tms_quiz/src/quiz/state/quizzes_state.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final userNotifier = UserNotifier();
  final quizzesNotifier = QuizzesNotifier();

  late final AppRouter appRouter;

  @override
  void initState(){
    appRouter = AppRouter(
    userNotifier: UserNotifier(),
    );
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return QuizzesState(
      notifier: quizzesNotifier,
      child: UserState(
        notifier: userNotifier,
        child: MaterialApp.router(
          debugShowCheckedModeBanner:false,
          routerConfig: appRouter.config(),
        ),
      ),
    );
  }
}