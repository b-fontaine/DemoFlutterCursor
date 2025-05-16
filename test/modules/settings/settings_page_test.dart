import 'package:demo_flutter_cursor/core/ui/theme/providers/app_theme.dart';
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

  testWidgets('Settings page contains ThemeSwitcher', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: ThemeData.light(),
          home: ThemeProvider(notifier: notifier, child: const SettingsPage()),
        ),
      ),
    );

    expect(find.text(SettingsStrings.themeTitle), findsOneWidget);
    expect(find.text(SettingsStrings.lightTheme), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });

  testWidgets('Theme can be toggled from Settings page', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: ThemeData.light(),
          home: ThemeProvider(notifier: notifier, child: const SettingsPage()),
        ),
      ),
    );

    // Initial state should be light mode
    expect(find.text(SettingsStrings.lightTheme), findsOneWidget);

    // Tap the switch
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    // After toggling, it should be dark mode
    expect(find.text(SettingsStrings.darkTheme), findsOneWidget);
    expect(notifier.toggleCallCount, 1);
  });
}
