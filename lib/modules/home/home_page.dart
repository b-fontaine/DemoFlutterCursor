import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          child: Text(
            'Hello World',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
