import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/providers/app_theme.dart';
import 'package:demo_flutter_cursor/core/ui/theme/texts.dart';
import 'package:demo_flutter_cursor/core/ui/theme/theme_data/theme_data_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// We use this to access the theme from the BuildContext in all our widgets
/// We don't use riverpod here so we can get the theme from the context and regular widgets
class ThemeProvider extends InheritedNotifier<AppThemeNotifier> {
  const ThemeProvider({super.key, super.notifier, required super.child});

  @override
  bool updateShouldNotify(
    covariant InheritedNotifier<AppThemeNotifier> oldWidget,
  ) {
    final isModeChanged = oldWidget.notifier!.mode != notifier!.mode;
    if (isModeChanged) {
      // keeep the same theme when switching between light and dark mode while hot reloading
      notifier!.mode = oldWidget.notifier!.mode;
      notifier!.setSystemBarColor();
    }
    return false;
  }

  static AppThemeNotifier of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!.notifier!;
}

/// This is the main theme provider
/// There is two main ways to use it
/// uniform: you define a single theme for all platforms
/// adaptive: you define different themes for different platforms
///
/// Defining a theme for light and dark should only change the colors
/// not redefining everything. (see ./docs/theme.md)
class AppThemeNotifier with ChangeNotifier {
  final AppTheme? lightTheme;
  final AppTheme? darkTheme;
  final SharedPreferences sharedPreferences;
  ThemeMode mode;

  AppThemeNotifier({
    required this.sharedPreferences,
    required this.mode,
    this.lightTheme,
    this.darkTheme,
  }) {
    mode = _loadFromPrefs();
    setSystemBarColor();
  }

  /// Allows you to define a single theme for all platforms
  /// for both light and dark mode or just one of them
  factory AppThemeNotifier.uniform({
    AppColors? lightColors,
    AppColors? darkColors,
    required AppTextTheme textTheme,
    required AppThemeDataFactory themeFactory,
    required ThemeMode defaultMode,
    required SharedPreferences sharedPreferences,
  }) {
    return AppThemeNotifier(
      mode: defaultMode,
      sharedPreferences: sharedPreferences,
      lightTheme:
          lightColors != null
              ? AppThemeUniform(
                themeFactory.build(
                  colors: lightColors,
                  defaultTextStyle: textTheme,
                ),
              )
              : null,
      darkTheme:
          darkColors != null
              ? AppThemeUniform(
                themeFactory.build(
                  colors: darkColors,
                  defaultTextStyle: textTheme,
                ),
              )
              : null,
    );
  }

  /// Allows you to define different themes for different platforms
  factory AppThemeNotifier.adaptive({
    required SharedPreferences sharedPreferences,
    // maybe you want to use different text themes for different platforms
    required AppTextTheme defaultTextTheme,
    required ThemeMode mode,
    AppColors? lightColors,
    AppColors? darkColors,
    AppThemeDataFactory? ios,
    AppThemeDataFactory? android,
    AppThemeDataFactory? web,
  }) {
    return AppThemeNotifier(
      mode: mode,
      sharedPreferences: sharedPreferences,
      lightTheme:
          lightColors != null
              ? AppThemeAdaptive(
                ios: ios?.build(
                  colors: lightColors,
                  defaultTextStyle: defaultTextTheme,
                ),
                android: android?.build(
                  colors: lightColors,
                  defaultTextStyle: defaultTextTheme,
                ),
                web: web?.build(
                  colors: lightColors,
                  defaultTextStyle: defaultTextTheme,
                ),
              )
              : null,
      darkTheme:
          darkColors != null
              ? AppThemeAdaptive(
                ios: ios?.build(
                  colors: darkColors,
                  defaultTextStyle: defaultTextTheme,
                ),
                android: android?.build(
                  colors: darkColors,
                  defaultTextStyle: defaultTextTheme,
                ),
                web: web?.build(
                  colors: darkColors,
                  defaultTextStyle: defaultTextTheme,
                ),
              )
              : null,
    );
  }

  /// automatically toggle between light and dark mode
  /// call this using AppTheme.of(context).toggle()
  void toggle() {
    mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveInPrefs(mode);
    notifyListeners();
    setSystemBarColor();
  }

  void setSystemBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            mode == ThemeMode.light ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            mode == ThemeMode.light ? Brightness.dark : Brightness.light,
        // statusBarColor: Colors.black, // color for android
        // statusBarBrightness: Brightness.light, // for ios Dark = white status
      ),
    );
  }

  ThemeData get dark {
    if (darkTheme == null) {
      throw Exception('Dark theme is not defined');
    }
    return darkThemeData.copyWith(
      brightness: Brightness.dark,
      extensions: [darkTheme!.colors, darkTheme!.textTheme],
    );
  }

  ThemeData get light {
    if (lightTheme == null) {
      throw Exception('Light theme is not defined');
    }
    return lightThemeData.copyWith(
      brightness: Brightness.light,
      extensions: [lightTheme!.colors, lightTheme!.textTheme],
    );
  }

  ThemeData get lightThemeData => lightTheme!.data.materialTheme;

  ThemeData get darkThemeData => darkTheme!.data.materialTheme;

  AppTheme get current {
    if (mode == ThemeMode.light) {
      return lightTheme!;
    } else {
      return darkTheme!;
    }
  }

  ThemeMode _loadFromPrefs() {
    final themeMode = sharedPreferences.getString('themeMode');
    if (themeMode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else if (themeMode == ThemeMode.light.name) {
      return ThemeMode.light;
    }
    return mode;
  }

  void _saveInPrefs(ThemeMode themeMode) {
    sharedPreferences.setString('themeMode', themeMode.name);
  }
}
