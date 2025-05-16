import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/texts.dart';
import 'package:demo_flutter_cursor/core/ui/theme/theme_data/theme_data.dart';
import 'package:demo_flutter_cursor/core/ui/theme/theme_data/theme_data_factory.dart';
import 'package:flutter/material.dart';

/// This is a uniform theme
/// But you can use it to create multiple themes for iOS, Android, Web, Desktop...
class UniversalThemeFactory extends AppThemeDataFactory {
  const UniversalThemeFactory();

  @override
  AppThemeData build({
    required AppColors colors,
    required AppTextTheme defaultTextStyle,
  }) {
    return AppThemeData(
      colors: colors,
      defaultTextTheme: defaultTextStyle,
      materialTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors.primary).copyWith(
          surface: colors.surface,
          onSurface: colors.onSurface,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          error: colors.error,
        ),
        elevatedButtonTheme: elevatedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        inputDecorationTheme: inputDecorationTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        textTheme: textTheme(
          colors: colors,
          defaultTextStyle: defaultTextStyle,
        ),
        navigationRailTheme: navigationRailThemeData(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.surface,
          foregroundColor: colors.onSurface,
          elevation: 0,
        ),
      ),
    );
  }

  NavigationRailThemeData navigationRailThemeData({
    required AppColors colors,
    required AppTextTheme textTheme,
  }) => NavigationRailThemeData(
    backgroundColor: colors.surface,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: colors.primary),
    unselectedIconTheme: IconThemeData(color: colors.grey2),
    selectedLabelTextStyle: textTheme.primary.copyWith(
      color: colors.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelTextStyle: textTheme.primary.copyWith(
      color: colors.onSurface,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );

  ElevatedButtonThemeData elevatedButtonTheme({
    required AppColors colors,
    required AppTextTheme textTheme,
  }) => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(200, 48),
      foregroundColor: colors.onPrimary,
      backgroundColor: colors.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: colors.primary.withValues(alpha: .8)),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: textTheme.primary.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colors.onPrimary,
      ),
      elevation: 0,
    ),
  );

  InputDecorationTheme inputDecorationTheme({
    required AppColors colors,
    required AppTextTheme textTheme,
  }) => InputDecorationTheme(
    fillColor: colors.surface,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: colors.grey1.withValues(alpha: .15)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: colors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: colors.error, width: 2),
    ),
    filled: true,
    hintStyle: textTheme.primary.copyWith(
      color: colors.grey2,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    labelStyle: textTheme.primary.copyWith(color: colors.grey2),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(color: colors.grey2),
    ),
  );

  PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  TextTheme textTheme({
    required AppColors colors,
    required AppTextTheme defaultTextStyle,
  }) => TextTheme(
    headlineLarge: defaultTextStyle.primary.copyWith(
      fontSize: 32,
      color: colors.onBackground,
      fontWeight: FontWeight.w700,
    ),
  );
}
