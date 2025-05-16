import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/authentication/ui/guards/guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticatedGuard extends ConsumerWidget {
  final Widget child;
  final String fallbackRoute;

  const AuthenticatedGuard({
    super.key,
    required this.child,
    required this.fallbackRoute,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(userStateNotifierProvider);
    if (authState.user.isLoading) {
      return const Material(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    return Guard(
      canActivate: Future.value(switch (authState.user) {
        AuthenticatedUserData() => true,
        AnonymousUserData(:final id) => id != null,
        _ => false,
      }),
      fallbackRoute: fallbackRoute,
      child: child,
    );
  }
}
