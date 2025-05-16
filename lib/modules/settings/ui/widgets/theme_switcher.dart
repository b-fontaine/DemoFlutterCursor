import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/core/ui/theme/providers/theme_provider.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/widgets/strings.dart';
import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeProvider.of(context);
    final isLightMode = themeNotifier.mode == ThemeMode.light;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.light_mode,
            size: 21,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              SettingsStrings.themeTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Text(
            isLightMode
                ? SettingsStrings.lightTheme
                : SettingsStrings.darkTheme,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(width: 8),
          Switch(
            value: isLightMode,
            onChanged: (_) {
              themeNotifier.toggle();
            },
          ),
        ],
      ),
    );
  }
}
