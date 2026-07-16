import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/routing/app_router.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return UserState(
      child: MaterialApp.router(
        debugShowCheckedModeBanner:false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}