import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/ui/providers/example_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/example/ui/widgets/date_info_tile.dart';
import 'package:demo_flutter_cursor/modules/example/ui/widgets/example_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleForm extends ConsumerStatefulWidget {
  final Example example;

  const ExampleForm({required this.example});

  @override
  ConsumerState<ExampleForm> createState() => ExampleFormState();
}

class ExampleFormState extends ConsumerState<ExampleForm> {
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

  void _saveChanges(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(exampleStateNotifierProvider.notifier);

    notifier.updateExample(
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
                DateInfoTile(
                  title: "Created",
                  date: widget.example.creationDate!,
                ),
              if (widget.example.creationDate != null) const Divider(),
              if (widget.example.lastUpdateDate != null)
                DateInfoTile(
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
          onPressed: () => _saveChanges(context, ref),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text("Save Changes"),
        ),
      ],
    );
  }
}
