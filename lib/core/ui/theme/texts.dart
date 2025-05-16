import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle primary;

  const AppTextTheme({required this.primary});

  factory AppTextTheme.build() => const AppTextTheme(
    primary: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xFF000000),
    ),
  );

  @override
  ThemeExtension<AppTextTheme> copyWith({TextStyle? primary}) {
    return AppTextTheme(primary: primary ?? this.primary);
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme(primary: TextStyle.lerp(primary, other.primary, t)!);
  }
}
