import 'package:demo_flutter_cursor/core/data/api/authentication_api.dart';
import 'package:demo_flutter_cursor/core/data/api/device_api.dart';
import 'package:demo_flutter_cursor/core/data/api/user_api.dart';
import 'package:demo_flutter_cursor/core/data/storage/secured_storage.dart';
import 'package:demo_flutter_cursor/core/data/storage/shared_preferences.dart';
import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:demo_flutter_cursor/core/initializer/models/run_state.dart';
import 'package:demo_flutter_cursor/core/initializer/onstart_service.dart';
import 'package:demo_flutter_cursor/core/initializer/onstart_widget.dart';
import 'package:demo_flutter_cursor/core/ui/states/models/user_state.dart';
import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/providers/theme_provider.dart';
import 'package:demo_flutter_cursor/core/ui/theme/texts.dart';
import 'package:demo_flutter_cursor/core/ui/theme/universal_theme.dart';
import 'package:demo_flutter_cursor/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/api/storage_api_fake.dart';
import 'core/data/storage/auth_secured_storage_fake.dart';
import 'core/device/data/device_api_fake.dart';
import 'modules/authentication/data/api/auth_api_fake.dart';
import 'modules/authentication/data/api/user_api_fake.dart';

/// Use this page to show a fake page within a test
class PageFake extends StatelessWidget {
  final Color color;

  const PageFake(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: color);
  }
}

extension AppWidgetTester on WidgetTester {
  /// Pump the given widget into an app with all our default fake APIs
  /// provided or override them with the given overrides
  /// this is useful to test a page and not rewrite all the providers
  /// Only APIs should be faked, not the repositories
  ///
  /// We will wait that all the providers are ready before pumping the page
  /// if that takes more than 10 pump, we will throw an exception
  ///
  /// If you want your test to use your app navigation, you can pass the routerConfig
  /// and the initialRoute from the routerGenerator function (lib/router.dart)
  /// For ex to test the signup page:
  /// ```generateRouter(initialLocation: '/signup')```
  Future<void> pumpPage({
    UserState? userState,
    AuthenticationApi? authApiFakeOverride,

    SecuredStorage? authSecuredStorageFakeOverride,
    DeviceApi? deviceApiFakeOverride,
    UserApi? userApiFakeOverride,

    Widget? home,
    RouterConfig<Object>? routerConfig,
    String? initialRoute,
  }) async {
    // await initFirebaseForTest();
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();
    late WidgetRef refCopie;
    await pumpWidget(
      ProviderScope(
        overrides: [
          authenticationApiProvider.overrideWithValue(
            authApiFakeOverride ?? FakeAuthenticationApi(),
          ),
          securedStorageProvider.overrideWithValue(
            authSecuredStorageFakeOverride ?? FakeAuthSecuredStorage.empty(),
          ),

          deviceApiProvider.overrideWithValue(
            deviceApiFakeOverride ?? FakeDeviceApi(),
          ),
          userApiProvider.overrideWithValue(
            userApiFakeOverride ?? FakeUserApi(storageApi: FakeStorageApi()),
          ),
        ],
        child: Consumer(
          builder: (context, ref, child) {
            refCopie = ref;

            final authStorageApi =
                ref.read(securedStorageProvider) as FakeAuthSecuredStorage;

            final authApi =
                ref.read(authenticationApiProvider) as FakeAuthenticationApi;

            final userApi = ref.read(userApiProvider) as FakeUserApi;

            authStorageApi.credentials = null;
            authApi.current = null;
            userApi.getUserResult = null;

            // if the test include a user state (anonymous or authenticated) we setup with it
            if (userState != null) {
              debugPrint("✅- Test user provided");

              authStorageApi.credentials = Credentials(
                id: userState.user.idOrThrow,
                token: 'fake-user-token-1234567890',
              );
              authApi.current = authStorageApi.credentials;

              userApi.getUserResult = switch (userState.user) {
                AuthenticatedUserData() => userState.user.toDTO(),
                AnonymousUserData() => userState.user.toDTO(),
                LoadingUserData() => null,
              };
            }

            // We now run the app like we do on the main function
            return ThemeProvider(
              notifier: AppTheme.uniform(
                sharedPreferences: sharedPrefs,
                themeFactory: const UniversalThemeFactory(),
                lightColors: ApparenceKitColors.light(),
                darkColors: ApparenceKitColors.dark(),
                textTheme: ApparenceKitTextTheme.build(),
                defaultMode: ThemeMode.light,
              ),
              child: Builder(
                builder: (context) {
                  return MaterialApp.router(
                    theme: ThemeProvider.of(context).light,
                    darkTheme: ThemeProvider.of(context).dark,
                    themeMode: ThemeProvider.of(context).mode,
                    builder:
                        (context, child) => Initializer(
                          services: [
                            // shared preferences must be loaded
                            sharedPreferencesProvider,

                            // user state
                            userStateNotifierProvider.notifier,
                          ],
                          onReady: child!,
                          onLoading: const Scaffold(
                            body: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                    routerConfig:
                        routerConfig ??
                        GoRouter(
                          navigatorKey: navigatorKey,
                          initialLocation: initialRoute ?? '/',
                          routes: [
                            GoRoute(
                              path: '/',
                              builder:
                                  (context, state) =>
                                      home ?? const PageFake(Colors.red),
                            ),
                          ],
                        ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
    // We wait that the app is ready before continuing
    final startHandlerNotifier = refCopie.read(onStartProvider.notifier);
    const maxWait = 100;
    var wait = 0;
    while (startHandlerNotifier.state is AppLoadingState) {
      await pump(const Duration(milliseconds: 100));
      wait++;
      if (wait > maxWait) {
        startHandlerNotifier.printDebugState();
        throw Exception('Timeout waiting for app to be ready');
      }
    }
    await pumpAndSettle();
  }
}
