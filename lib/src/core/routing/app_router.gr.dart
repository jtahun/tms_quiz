// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:tms_quiz/src/quiz/screens/quizzes_screen.dart' as _i2;
import 'package:tms_quiz/src/user/screen/login_screen.dart' as _i1;
import 'package:tms_quiz/src/user/screen/signup_screen.dart' as _i3;
import 'package:tms_quiz/src/user/screen/welcome_screen.dart' as _i4;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.QuizzesScreen]
class QuizzesRoute extends _i5.PageRouteInfo<void> {
  const QuizzesRoute({List<_i5.PageRouteInfo>? children})
    : super(QuizzesRoute.name, initialChildren: children);

  static const String name = 'QuizzesRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.QuizzesScreen();
    },
  );
}

/// generated route for
/// [_i3.SignupScreen]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute({List<_i5.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignupScreen();
    },
  );
}

/// generated route for
/// [_i4.WelcomeScreen]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute({List<_i5.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.WelcomeScreen();
    },
  );
}
