import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This is an example of a page widget.
/// It demonstrates the standard structure for a page in this application.
class ExamplePage extends ConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Here you can watch state from a provider
    // final exampleState = ref.watch(exampleStateProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Page title
            Text(
              "Example Page",
              style: context.textTheme.headlineLarge!.copyWith(
                color: context.colors.onBackground,
              ),
            ),
            const SizedBox(height: 24),

            // Example of a container with content
            ExampleContainer(
              child: Wrap(
                children: [
                  ExampleTile(
                    icon: Icons.home,
                    title: "Example item 1",
                    onTap: () {
                      // Handle tap action
                    },
                  ),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  ExampleTile(
                    icon: Icons.settings,
                    title: "Example item 2",
                    onTap: () {
                      // Handle tap action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A container widget used to group elements
class ExampleContainer extends StatelessWidget {
  final Widget child;

  const ExampleContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}

/// A reusable tile widget for the example page
class ExampleTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ExampleTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
