import 'package:demo_flutter_cursor/core/data/api/http_client.dart';
import 'package:demo_flutter_cursor/core/data/repositories/authentication_repository.dart';
import 'package:demo_flutter_cursor/modules/authentication/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../core/data/api/storage_api_fake.dart';
import '../../core/data/storage/auth_secured_storage_fake.dart';
import '../../test_utils.dart';
import 'data/api/auth_api_fake.dart';
import 'data/api/user_api_fake.dart';

void main() {
  final authApiFake = FakeAuthenticationApi();
  final storageFake = FakeAuthSecuredStorage.empty();

  final authRepository = AuthenticationRepository(
    logger: Logger(),
    authenticationApi: authApiFake,
    storage: storageFake,
    userApi: FakeUserApi(storageApi: FakeStorageApi()),
    httpClient: HttpClient(baseUrl: ''),
  );

  Future<void> beforeTest(WidgetTester tester) async {
    await tester.pumpPage(
      authApiFakeOverride: authApiFake,
      authSecuredStorageFakeOverride: storageFake,
      routerConfig: GoRouter(
        initialLocation: '/signup',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const PageFake(Colors.blueAccent),
          ),
          GoRoute(
            path: '/signup',
            builder: (context, state) => const SignupPage(),
          ),
        ],
      ),
    );
    await authRepository.logout();
  }

  final validInputs = ValueVariant<SignupTestEntry>({
    const SignupTestEntry("test@example.com", "password"),
    // const SignupTestEntry("test@gmail.com", "passwordddd@1254"),
    // const SignupTestEntry("12d1@ouch.is", "AdndjFFFGG"),
  });

  final invalidInputs = ValueVariant<SignupTestEntry>({
    const SignupTestEntry("test.com", "password"),
    const SignupTestEntry("test@gmail", "password1254"),
    const SignupTestEntry("12d1@ouch.is", "a"),
  });

  testWidgets(
    'fill valid email, password and submit => should create user',
    (tester) async {
      await beforeTest(tester);

      var auth = await authRepository.get();
      expect(auth, isNull, reason: 'user should be not authenticated');

      final emailInputFinder = find.byKey(const Key('email_input'));
      final passwordInputFinder = find.byKey(const Key('password_input'));

      // Enter text into the email and password input fields
      await tester.enterText(emailInputFinder, validInputs.currentValue!.email);
      await tester.enterText(
        passwordInputFinder,
        validInputs.currentValue!.password,
      );
      await tester.pumpAndSettle();

      // Find and tap the send button
      final sendButtonFinder = find.byKey(const Key('send_button'));
      await tester.tap(sendButtonFinder);

      // Wait for the state to update and our fake delay to finish
      await tester.pump(const Duration(milliseconds: 1500));
      await tester.pumpAndSettle(const Duration(milliseconds: 50));

      auth = await authRepository.get();
      expect(auth, isNotNull, reason: 'user should be authenticated');
    },
    variant: validInputs,
  );

  testWidgets(
    'fill invalid email or password and submit => should not try to create user',
    (tester) async {
      await beforeTest(tester);

      // Find the email and password input fields
      final emailInputFinder = find.byKey(const Key('email_input'));
      final passwordInputFinder = find.byKey(const Key('password_input'));

      // Enter text into the email and password input fields
      await tester.enterText(
        emailInputFinder,
        invalidInputs.currentValue!.email,
      );
      await tester.enterText(
        passwordInputFinder,
        invalidInputs.currentValue!.password,
      );

      // Find and tap the send button
      final sendButtonFinder = find.byKey(const Key('send_button'));
      await tester.tap(sendButtonFinder);

      // Wait for the state to update
      await tester.pump(const Duration(milliseconds: 1500));

      final auth = await authRepository.get();
      expect(auth, isNull, reason: 'Email or password was incorect');
    },
    variant: invalidInputs,
  );
}

class SignupTestEntry {
  final String email;
  final String password;

  const SignupTestEntry(this.email, this.password);

  @override
  String toString() {
    return '{email: $email, password: $password}';
  }
}
