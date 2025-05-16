import 'package:demo_flutter_cursor/core/ui/theme/colors.dart';
import 'package:demo_flutter_cursor/core/ui/theme/texts.dart';
import 'package:demo_flutter_cursor/core/ui/theme/theme_data/theme_data.dart';
import 'package:universal_io/io.dart';

/// This is the the base theme for the app
/// It is used to generate the light and dark themes
sealed class AppTheme {
  const AppTheme();

  AppColors get colors;

  AppTextTheme get textTheme;

  AppThemeData get data;
}

class AppThemeUniform extends AppTheme {
  const AppThemeUniform(this.data);

  @override
  final AppThemeData data;

  @override
  AppColors get colors => data.colors;

  @override
  AppTextTheme get textTheme => data.defaultTextTheme;
}

/// If you want to have different
/// themes for different platforms
class AppThemeAdaptive extends AppTheme {
  final AppThemeData? ios;
  final AppThemeData? android;
  final AppThemeData? web;

  const AppThemeAdaptive({this.ios, this.android, this.web});

  @override
  AppColors get colors {
    if (Platform.isIOS) {
      return ios!.colors;
    } else if (Platform.isAndroid) {
      return android!.colors;
    } else {
      return web!.colors;
    }
  }

  @override
  AppTextTheme get textTheme {
    if (Platform.isIOS) {
      return ios!.defaultTextTheme;
    } else if (Platform.isAndroid) {
      return android!.defaultTextTheme;
    } else {
      return web!.defaultTextTheme;
    }
  }

  @override
  AppThemeData get data {
    if (Platform.isIOS) {
      return ios!;
    } else if (Platform.isAndroid) {
      return android!;
    } else {
      return web!;
    }
  }
}
