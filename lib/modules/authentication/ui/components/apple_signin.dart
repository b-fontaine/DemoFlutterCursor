// ignore_for_file: use_build_context_synchronously

import 'package:demo_flutter_cursor/core/ui/widgets/toast.dart';
import 'package:demo_flutter_cursor/modules/authentication/ui/providers/signin_state_provider.dart';
import 'package:demo_flutter_cursor/modules/authentication/ui/widgets/round_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppleSigninComponent extends ConsumerWidget {
  const AppleSigninComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SocialSigninButton.apple(
      () => ref
          .read(signinStateProvider.notifier)
          .signinWithApple()
          .catchError(
            (err) => showErrorToast(
              context: context,
              title: 'Error',
              text: 'Cannot signin with facebook',
            ),
          )
          .then((value) => context.pushReplacement('/')),
    );
  }
}
