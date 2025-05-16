import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/providers/theme_provider.dart';
import 'package:demo_flutter_cursor/core/ui/theme/theme_data/theme_data.dart';
import 'package:flutter/material.dart';

/// This is a convenience extension to access the theme
/// from the BuildContext
/// Instead of calling Theme.of(context) everywhere
/// You can just call context.theme or context.colors...
extension AppThemeExt on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  Brightness get brightness => Theme.of(this).brightness;

  AppThemeData get appTheme => ThemeProvider.of(this).current.data;
}
