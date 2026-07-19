
import 'package:auto_route/auto_route.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';
import 'package:tms_quiz/src/core/routing/guards/auth_guard.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final UserNotifier userNotifier;

  AppRouter({required this.userNotifier});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),// initial: true),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: WelcomeRoute.page),// initial: true),
        AutoRoute(page: QuizzesRoute.page, initial: true, guards: [
          AuthGuard(userNotifier: userNotifier),
        ]),
        AutoRoute(page: QuizRoute.page),
      ];
}