import 'package:demo_flutter_cursor/core/ui/theme/providers/theme_provider.dart';
import 'package:demo_flutter_cursor/modules/settings/settings_page.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/widgets/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAppThemeNotifier extends AppThemeNotifier {
  int toggleCallCount = 0;

  MockAppThemeNotifier({required super.sharedPreferences, required super.mode});

  @override
  void toggle() {
    toggleCallCount++;
    mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

void main() {
  late MockAppThemeNotifier notifier;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    notifier = MockAppThemeNotifier(
      sharedPreferences: sharedPreferences,
      mode: ThemeMode.light,
    );
  });

}
