import 'package:auto_route/auto_route.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';

class AuthGuard extends AutoRouteGuard {
  final UserNotifier userNotifier;

  const AuthGuard({
    required this.userNotifier
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router){
    if(userNotifier.isAuthenticated){
      resolver.next(true);
      return;
    }
    print('Not Authenticated');
    router.push(const WelcomeRoute());
  }
}