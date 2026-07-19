// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:tms_quiz/src/quiz/models/quiz.dart' as _i8;
import 'package:tms_quiz/src/quiz/screens/quiz_screen.dart' as _i2;
import 'package:tms_quiz/src/quiz/screens/quizzes_screen.dart' as _i3;
import 'package:tms_quiz/src/user/screen/login_screen.dart' as _i1;
import 'package:tms_quiz/src/user/screen/signup_screen.dart' as _i4;
import 'package:tms_quiz/src/user/screen/welcome_screen.dart' as _i5;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.QuizScreen]
class QuizRoute extends _i6.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i7.Key? key,
    required _i8.Quiz quiz,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         QuizRoute.name,
         args: QuizRouteArgs(key: key, quiz: quiz),
         initialChildren: children,
       );

  static const String name = 'QuizRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteArgs>();
      return _i2.QuizScreen(key: args.key, quiz: args.quiz);
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({this.key, required this.quiz});

  final _i7.Key? key;

  final _i8.Quiz quiz;

  @override
  String toString() {
    return 'QuizRouteArgs{key: $key, quiz: $quiz}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizRouteArgs) return false;
    return key == other.key && quiz == other.quiz;
  }

  @override
  int get hashCode => key.hashCode ^ quiz.hashCode;
}

/// generated route for
/// [_i3.QuizzesScreen]
class QuizzesRoute extends _i6.PageRouteInfo<void> {
  const QuizzesRoute({List<_i6.PageRouteInfo>? children})
    : super(QuizzesRoute.name, initialChildren: children);

  static const String name = 'QuizzesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.QuizzesScreen();
    },
  );
}

/// generated route for
/// [_i4.SignupScreen]
class SignupRoute extends _i6.PageRouteInfo<void> {
  const SignupRoute({List<_i6.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignupScreen();
    },
  );
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute({List<_i6.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.WelcomeScreen();
    },
  );
}
