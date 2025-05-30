import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
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
                  : _ExampleForm(example: state.example!, notifier: notifier),
        ),
      ),
    );
  }
}

class _ExampleForm extends StatefulWidget {
  final Example example;
  final ExampleStateNotifier notifier;

  const _ExampleForm({required this.example, required this.notifier});

  @override
  State<_ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<_ExampleForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.example.name);
    _descriptionController = TextEditingController(
      text: widget.example.description ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    widget.notifier.updateExample(
      _nameController.text,
      _descriptionController.text.isEmpty ? null : _descriptionController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Example updated successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Example ID display
        ExampleContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID", style: context.textTheme.labelLarge),
              const SizedBox(height: 8),
              Text(widget.example.id, style: context.textTheme.bodyLarge),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Name field
        ExampleContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name", style: context.textTheme.labelLarge),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter example name',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Description field
        ExampleContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description", style: context.textTheme.labelLarge),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter example description (optional)',
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Creation and update dates
        ExampleContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dates", style: context.textTheme.labelLarge),
              const SizedBox(height: 8),
              if (widget.example.creationDate != null)
                _DateInfoTile(
                  title: "Created",
                  date: widget.example.creationDate!,
                ),
              if (widget.example.creationDate != null) const Divider(),
              if (widget.example.lastUpdateDate != null)
                _DateInfoTile(
                  title: "Last Updated",
                  date: widget.example.lastUpdateDate!,
                ),
              if (widget.example.creationDate == null &&
                  widget.example.lastUpdateDate == null)
                Text("No dates available", style: context.textTheme.bodyMedium),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Save button
        ElevatedButton(
          onPressed: _saveChanges,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text("Save Changes"),
        ),
      ],
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Widget to display a date with a title
class _DateInfoTile extends StatelessWidget {
  final String title;
  final DateTime date;

  const _DateInfoTile({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.bodyMedium),
        Text(formattedDate, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
