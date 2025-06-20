import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/components/avatar_component.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/components/delete_user_component.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/widgets/settings_tile.dart';
import 'package:demo_flutter_cursor/modules/settings/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              "Settings",
              style: context.textTheme.headlineLarge!.copyWith(
                color: context.colors.onBackground,
              ),
            ),
            const SizedBox(height: 24),
            const ProfileTile(
              title: "My account", // userState.user.name,
              subtitle: "johndoe@gmail.com", // userState.user.email,
            ),
            const SizedBox(height: 24),
            SettingsContainer(
              child: Wrap(
                children: [
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  const ThemeSwitcher(),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.message_rounded,
                    title: "Send feedback",
                    onTap: () => context.push('/feedback'),
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.privacy_tip,
                    title: "Privacy policy",
                    onTap: () {
                      launchUrl(Uri.parse("https://google.com/"));
                    },
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.help,
                    title: "Support",
                    onTap: () {
                      launchUrl(Uri.parse("https://google.com/"));
                    },
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.logout,
                    title: "Disconnect",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: const Text('Disconnect'),
                            content: const Text(
                              'Are you sure you want to disconnect?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Disconnect'),
                                onPressed: () {
                                  ref
                                      .read(userStateNotifierProvider.notifier)
                                      .onLogout();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const DeleteUserButton(),
          ],
        ),
      ),
    );
  }
}

class SettingsContainer extends StatelessWidget {
  final Widget child;

  const SettingsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;

  const ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsContainer(
      child: Row(
        children: [
          const EditableUserAvatar(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
