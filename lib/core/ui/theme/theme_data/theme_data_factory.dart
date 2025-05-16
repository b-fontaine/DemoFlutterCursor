import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/texts.dart';
import 'package:demo_flutter_cursor/core/ui/theme/theme_data/theme_data.dart';

/// This is the factory used to create the theme from the colors and textTheme
/// You can create your own factory to create your own theme
/// see universal_theme.dart for an example
abstract class AppThemeDataFactory {
  const AppThemeDataFactory();

  AppThemeData build({
    required AppColors colors,
    required AppTextTheme defaultTextStyle,
  });
}
