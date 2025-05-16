import 'package:demo_flutter_cursor/core/data/storage/shared_preferences.dart';
import 'package:demo_flutter_cursor/core/initializer/onstart_widget.dart';
import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/core/ui/theme/providers/theme_provider.dart';
import 'package:demo_flutter_cursor/core/ui/theme/texts.dart';
import 'package:demo_flutter_cursor/core/ui/theme/universal_theme.dart';
import 'package:demo_flutter_cursor/environnements.dart';
import 'package:demo_flutter_cursor/firebase_options_dev.dart' as firebase_dev;
import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:demo_flutter_cursor/core/data/api/authentication_api.dart';
import 'package:demo_flutter_cursor/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  final env = Environment.fromEnv();
  final logger = Logger();
  logger.i('Starting app in ${env.name} mode');
  // I like to force portrait mode on mobile devices
  // What is the last time you used an app in landscape mode?
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // initialize shared preferences for theme
  final sharedPrefs = await SharedPreferences.getInstance();

  // initialize firebase app for notifications
  await switch (env) {
    DevEnvironment() => Firebase.initializeApp(
      options: firebase_dev.DefaultFirebaseOptions.currentPlatform,
    ),
    ProdEnvironment() => Firebase.initializeApp(
      // TODO replace with your own firebase options for production environment (if needed)
      options: firebase_dev.DefaultFirebaseOptions.currentPlatform,
    ),
  };

  run(sharedPrefs);
}

void run(SharedPreferences prefs) => runApp(
  TranslationProvider(
    child: ProviderScope(child: MyApp(sharedPreferences: prefs)),
  ),
);

// use this if you want to define different themes for different platforms
// notifier: AppTheme.adaptive(
//   defaultTextTheme: ApparenceKitTextTheme.build(),
//   ios: const IosThemeFactory(),
//   android: const AndroidThemeFactory(),
//   web: const WebThemeFactory(),
//   lightColors: ApparenceKitColors.light(),
//   darkColors: ApparenceKitColors.dark(),
//   mode: ThemeMode.dark,
// ),
// See ./docs/theme.md for more details
class MyApp extends ConsumerWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return AppErrorWidget(error: details);
    };
    final goRouter = ref.watch(goRouterProvider);

    return ThemeProvider(
      notifier: AppTheme.uniform(
        sharedPreferences: sharedPreferences,
        themeFactory: const UniversalThemeFactory(),
        lightColors: ApparenceKitColors.light(),
        darkColors: ApparenceKitColors.dark(),
        textTheme: ApparenceKitTextTheme.build(),
        defaultMode: ThemeMode.light,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Flutter Pro Starter Kit',
            theme: ThemeProvider.of(context).light,
            darkTheme: ThemeProvider.of(context).dark,
            themeMode: ThemeProvider.of(context).mode,
            routerConfig: goRouter,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            // Initializer is a widget that allows us to run some code before the app is ready
            builder:
                (context, child) => Initializer(
                  services: [
                    authenticationApiProvider,
                    // shared preferences must be loaded
                    sharedPreferencesProvider,

                    // user state
                    userStateNotifierProvider.notifier,
                  ],
                  onReady: child!,
                  onError: (_, error) => InitializationErrorPage(error: error),
                  onLoading: const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ),
                ),
          );
        },
      ),
    );
  }
}

/// This is an example of a more user friendly error widget
/// By default Flutter will show a red screen with the error in debug mode
/// and a grey screen in release mode
class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? error;

  const AppErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Oups!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sorry, Something went wrong',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            '${error?.exception}\n',
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class InitializationErrorPage extends StatelessWidget {
  final String error;

  const InitializationErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            Text('Cannot start app', style: context.textTheme.titleLarge),
            Text(
              'Check your internet connection and start again',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.grey3,
              ),
            ),
            if (kDebugMode)
              Text(
                "developper mode error: $error",
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.error,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
