import 'package:demo_flutter_cursor/modules/example/ui/example_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// this homepage is for demo purpose only
/// You can delete it and start from scratch
class HomePage extends ConsumerWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => context.pushNamed(ExamplePage.routeName),
            child: const Text('Example Page'),
          ),
        ),
      ),
    );
  }
}
