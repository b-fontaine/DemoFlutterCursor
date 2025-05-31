import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/example/ui/components/example_form.dart';
import 'package:demo_flutter_cursor/modules/example/ui/providers/example_state.dart';
import 'package:demo_flutter_cursor/modules/example/ui/providers/example_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamplePage extends ConsumerWidget {
  static const routeName = 'example';

  final String exampleId;

  const ExamplePage({super.key, required this.exampleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(exampleStateNotifierProvider.notifier);

    ref.listen<ExampleState>(exampleStateNotifierProvider, (previous, current) {
      if (previous?.example?.id != exampleId &&
          current.example?.id != exampleId) {
        Future.microtask(() => notifier.init(exampleId));
      }
    });

    final state = ref.watch(exampleStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Example Details", style: context.textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              state.example == null
                  ? const Center(child: CircularProgressIndicator())
                  : ExampleForm(example: state.example!),
        ),
      ),
    );
  }
}
