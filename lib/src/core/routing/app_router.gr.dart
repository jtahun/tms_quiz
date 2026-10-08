// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:tms_quiz/src/quiz/models/quiz.dart' as _i10;
import 'package:tms_quiz/src/quiz/models/quiz_result.dart' as _i9;
import 'package:tms_quiz/src/quiz/screens/quiz_result_screen.dart' as _i2;
import 'package:tms_quiz/src/quiz/screens/quiz_screen.dart' as _i3;
import 'package:tms_quiz/src/quiz/screens/quizzes_screen.dart' as _i4;
import 'package:tms_quiz/src/user/screen/login_screen.dart' as _i1;
import 'package:tms_quiz/src/user/screen/signup_screen.dart' as _i5;
import 'package:tms_quiz/src/user/screen/welcome_screen.dart' as _i6;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.QuizResultScreen]
class QuizResultRoute extends _i7.PageRouteInfo<QuizResultRouteArgs> {
  QuizResultRoute({
    _i8.Key? key,
    required _i9.QuizResult result,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         QuizResultRoute.name,
         args: QuizResultRouteArgs(key: key, result: result),
         initialChildren: children,
       );

  static const String name = 'QuizResultRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizResultRouteArgs>();
      return _i2.QuizResultScreen(key: args.key, result: args.result);
    },
  );
}

class QuizResultRouteArgs {
  const QuizResultRouteArgs({this.key, required this.result});

  final _i8.Key? key;

  final _i9.QuizResult result;

  @override
  String toString() {
    return 'QuizResultRouteArgs{key: $key, result: $result}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizResultRouteArgs) return false;
    return key == other.key && result == other.result;
  }

  @override
  int get hashCode => key.hashCode ^ result.hashCode;
}

/// generated route for
/// [_i3.QuizScreen]
class QuizRoute extends _i7.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i8.Key? key,
    required _i10.Quiz quiz,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         QuizRoute.name,
         args: QuizRouteArgs(key: key, quiz: quiz),
         initialChildren: children,
       );

  static const String name = 'QuizRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteArgs>();
      return _i3.QuizScreen(key: args.key, quiz: args.quiz);
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({this.key, required this.quiz});

  final _i8.Key? key;

  final _i10.Quiz quiz;

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
/// [_i4.QuizzesScreen]
class QuizzesRoute extends _i7.PageRouteInfo<void> {
  const QuizzesRoute({List<_i7.PageRouteInfo>? children})
    : super(QuizzesRoute.name, initialChildren: children);

  static const String name = 'QuizzesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.QuizzesScreen();
    },
  );
}

/// generated route for
/// [_i5.SignupScreen]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute({List<_i7.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignupScreen();
    },
  );
}

/// generated route for
/// [_i6.WelcomeScreen]
class WelcomeRoute extends _i7.PageRouteInfo<void> {
  const WelcomeRoute({List<_i7.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.WelcomeScreen();
    },
  );
}
