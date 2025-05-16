import 'package:demo_flutter_cursor/modules/authentication/ui/guards/authenticated_guard.dart';
import 'package:demo_flutter_cursor/core/widgets/page_not_found.dart';
import 'package:demo_flutter_cursor/modules/authentication/recover_password_page.dart';
import 'package:demo_flutter_cursor/modules/authentication/signin_page.dart';
import 'package:demo_flutter_cursor/modules/authentication/signup_page.dart';
import 'package:demo_flutter_cursor/modules/home/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) => generateRouter());

extension GoRouterRiverpod on Ref {
  GoRouter get goRouter => read(goRouterProvider);
}

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter generateRouter({
  String? initialLocation,
  List<GoRoute>? additionalRoutes,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) => const PageNotFound(),
    observers: [...?observers],
    routes: [
      GoRoute(
        name: HomePage.routeName,
        path: '/',
        builder:
            (context, state) => const AuthenticatedGuard(
              fallbackRoute: '/signup',
              child: HomePage(),
            ),
      ),

      GoRoute(
        name: SignupPage.routeName,
        path: '/${SignupPage.routeName}',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: SigninPage.routeName,
        path: '/${SigninPage.routeName}',
        builder: (context, state) => const SigninPage(),
      ),

      GoRoute(
        name: RecoverPasswordPage.routeName,
        path: '/${RecoverPasswordPage.routeName}',
        builder: (context, state) => const RecoverPasswordPage(),
      ),
      GoRoute(
        name: '404',
        path: '/404',
        builder: (context, state) => const PageNotFound(),
      ),
    ],
  );
}
