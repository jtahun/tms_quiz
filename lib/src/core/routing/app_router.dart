
import 'package:auto_route/auto_route.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: WelcomeRoute.page),
      ];
}