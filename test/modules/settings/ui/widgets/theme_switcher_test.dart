import 'package:demo_flutter_cursor/core/ui/theme/providers/theme_provider.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/widgets/strings.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAppThemeNotifier extends AppThemeNotifier {
  MockAppThemeNotifier({required super.sharedPreferences, required super.mode});

  @override
  void toggle() {
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

  testWidgets('ThemeSwitcher displays correct initial theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: ThemeProvider(
          notifier: notifier,
          child: const Scaffold(body: ThemeSwitcher()),
        ),
      ),
    );

    expect(find.text(SettingsStrings.lightTheme), findsOneWidget);
    expect(find.text(SettingsStrings.themeTitle), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });

  testWidgets('ThemeSwitcher toggles theme on switch tap', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: ThemeProvider(
          notifier: notifier,
          child: const Scaffold(body: ThemeSwitcher()),
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
  });
}
