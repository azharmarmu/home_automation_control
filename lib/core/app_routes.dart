import 'package:flutter/material.dart';
import 'package:home_automation_control/presentation/ui/detail/detail_page.dart';
import 'package:home_automation_control/presentation/ui/error/error_screen.dart';
import 'package:home_automation_control/presentation/ui/landing/landing_page.dart';
import 'package:home_automation_control/presentation/ui/sign_in/signin_page.dart';
import 'package:home_automation_control/presentation/ui/sign_up/signup_page.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

Route<dynamic> generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  switch (settings.name) {

    case AppRoutes.signin:
      return MaterialPageRoute(
        builder: (_) => SignInPage(),
      );

    case AppRoutes.signup:
      return MaterialPageRoute(
        builder: (_) => SignUpPage(),
      );

    case AppRoutes.landing:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
      );

    case AppRoutes.details:
      return MaterialPageRoute(
        builder: (_) => const DetailPage(),
      );

    default:
      return _errorRoute(args, settings.name);
  }
}

MaterialPageRoute _errorRoute(dynamic args, String? name) {
  return MaterialPageRoute(
    builder: (_) => Center(
      child: Scaffold(
        appBar: AppBar(),
        body: ErrorPage(message: name),
      ),
    ),
  );
}

class AppRoutes {
  //Authentication
  static const String signin = '/';
  static const String signup = '/signup';
  static const String landing = '/landing';
  static const String details = '/details';
}

class BouncyPageRoute extends PageRouteBuilder {
  final Widget child;

  BouncyPageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secAnimation) => child,
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.elasticInOut,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class FadePageRoute extends PageRouteBuilder {
  final Widget child;

  FadePageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secAnimation) => child,
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, secAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
