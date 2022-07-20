import 'package:flutter/material.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';
import 'package:ourpass_assessment/features/authentication/presentation/pages/auth_selection/auth_selection_page.dart';
import 'package:ourpass_assessment/features/authentication/presentation/pages/create_account/create_account_page.dart';
import 'package:ourpass_assessment/features/splashscreen/presentation/pages/splashscreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splashScreen:
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      case RoutePaths.authSelectionPage:
        return MaterialPageRoute(builder: (_) => const AuthSelectionPage());
      case RoutePaths.createAccountPage:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}